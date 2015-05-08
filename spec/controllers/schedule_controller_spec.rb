require 'rails_helper'

describe ScheduleController, type: :controller do

  before :all do
    user1 = User.create name: 'Yason'
    user2 = User.create name: 'Lucas'
    3.times do| i |
      user1.support_assignments.create date: (Date.today + i)
    end
    (3..5).each do | i |
      user2.support_assignments.create date: (Date.today + i)
    end
  end

  describe 'GET #index' do
    it 'assigns all duty assignments as @schedule' do
      get :index
      expect(assigns(:schedule)).to eq SupportAssignment.count
    end
  end
end
