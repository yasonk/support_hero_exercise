class Schedule
  attr_reader :assignments

  def initialize
    @assignments = SupportAssignment.all.order :date
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