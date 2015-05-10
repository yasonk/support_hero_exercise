class SupportAssignment < ActiveRecord::Base
  belongs_to :user
  validates :user_id, uniqueness: {:scope => :date, message: "already to duty on this date"}
  validate do | assignment |
    assignment.errors.add(:user_id, ' is unavailable on the specified date') unless assignment.user.available?(assignment.date)
  end
end
