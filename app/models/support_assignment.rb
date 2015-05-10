class SupportAssignment < ActiveRecord::Base
  belongs_to :user
  validates :user_id, uniqueness: {:scope => :date}
end
