class User < ActiveRecord::Base
  has_many :support_assignments, :dependent => :destroy

end