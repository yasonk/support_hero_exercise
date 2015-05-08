require 'rails_helper'

describe SupportAssignment do

  let!(:user) { User.create name: 'Yason' }
  let!(:assignment) { SupportAssignment.create date: Date.today, user_id: user.id}

end