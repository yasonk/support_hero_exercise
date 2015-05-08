require 'rails_helper'

describe ScheduleController, type: :controller do
  before :all do
    user1 = User.create name: 'Yason'
    3.times do| i |
      user1.support_assignments.create date: (Date.today + i)
    end

    user2 = User.create name: 'Lucas'
    (3..5).each do | i |
      user2.support_assignments.create date: (Date.today + i)
    end
  end

  describe 'GET #index' do
    it 'assigns all duty assignments as @schedule' do
      get :index
      expect(assigns(:schedule).count).to eq 6
    end
  end

  describe 'GET #user_schedule' do
    it 'assigns all duty assignments as @schedule' do
      user = User.where(name: 'Yason').first
      get :user_schedule, id: user.to_param
      expect(assigns(:schedule).count).to eq 3
    end
  end
end
