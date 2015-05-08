class User < ActiveRecord::Base
  has_many :support_assignments, :dependent => :destroy

  def available? date
    return true
  end
end