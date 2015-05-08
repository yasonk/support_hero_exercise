class User < ActiveRecord::Base
  has_many :support_assignments, :dependent => :destroy

  def available? date
    nil
  end

  def schedule
    nil
  end
end