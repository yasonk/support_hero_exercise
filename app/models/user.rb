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
      Schedule.new.replace_assignment assignment_conflicts[0]
    end
  end
end