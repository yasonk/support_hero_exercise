class User < ActiveRecord::Base
  has_many :support_assignments, :dependent => :destroy

  def available? date
    date != unavailable_date
  end

  def to_param
    name
  end

  def schedule
    nil
  end
end