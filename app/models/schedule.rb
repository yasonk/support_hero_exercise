class Schedule
  attr_reader :assignments

  def initialize
    @assignments = SupportAssignment.all.order :date
  end

  def full_schedule
    assignments.to_a
  end

  def assignment_for_date date
    assignments.where(date: date).first
  end

  def user_schedule user_id
    assignments.where(user_id: user_id).to_a
  end

  def replace_assignment assignment
    future_assignment = available_user(assignment.date).future_assignment
    assignment.user.assign_duty future_assignment.date
    available_user.assign_duty assignment.date
    assignment.destroy
    future_assignment.destroy
  end

  private

  def available_user date
    User.where.not(unavailable_date: date).first
  end

end