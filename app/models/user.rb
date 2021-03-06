class User < ActiveRecord::Base
  has_many :support_assignments, :dependent => :destroy
  validates :name, presence: true

  # Returns true if the user is available on the specified date.
  def available? date
    date != unavailable_date
  end

  # Assigns the user to support duty, if the user is available on the specified date.
  def assign_duty date
    support_assignments.create(date: date) if available? date
  end

  # Marks the user as unavailable for duty on the specified date.
  # If the user was assigned to duty on this date, another user swaps duty with this user.
  def unavailable_date= date
    write_attribute(:unavailable_date, date) if reconcile_schedule_conflicts date
  end

  # Returns a support assignment for the user with the date in the future
  def future_assignment
    support_assignments.select{ |assignment| assignment.date.future? }.first
  end

  # Produces a array of users who are available on the specified date
  def self.available_users date
    (User.where(unavailable_date: nil) | User.where.not(unavailable_date: date)).to_a
  end

  private

  # Returns true if schedule was successfully reconciled. False otherwise
  def reconcile_schedule_conflicts date
    assignment_conflicts = support_assignments.select {|assignment| assignment.date == date}
    if assignment_conflicts.present?
      replace_assignment assignment_conflicts[0]
    else
      true
    end
  end

  # Returns true if replacement was successful. Otherwise returns false.
  def replace_assignment assignment
    backup = another_user(User.available_users assignment.date)
    return false if backup.blank?

    future_assignment = backup.future_assignment
    self.assign_duty future_assignment.date
    backup.assign_duty assignment.date
    assignment.destroy
    future_assignment.destroy
    true
  end

  def another_user users
    users.reject{| user | user.id == self.id}.first
  end

  def another_user_available? date
    another_user(User.available_users date).present?
  end
end