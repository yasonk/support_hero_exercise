class User < ActiveRecord::Base
  has_many :support_assignments, :dependent => :destroy

  def available? date
    date != unavailable_date
  end

  def assign_duty date
    support_assignments.create(date: date) if available? date
  end

  def unavailable_date= date
    reconcile_schedule_conflicts date
    write_attribute :unavailable_date, date
  end

  def future_assignment
    support_assignments.select{ |assignment| assignment.date.future? }.first
  end

  private

  def reconcile_schedule_conflicts date
    assignment_conflicts = support_assignments.select {|assignment| assignment.date == date}
    if assignment_conflicts.present?
      replace_assignment assignment_conflicts[0]
    end
  end

  def replace_assignment assignment
    future_assignment = available_users(assignment.date).first.future_assignment
    future_assignment.user.assign_duty assignment.date
    assignment.user.assign_duty future_assignment.date
    assignment.destroy
    future_assignment.destroy
  end

  def available_users date
    User.where(unavailable_date: nil) | User.where.not(unavailable_date: date)
  end
end