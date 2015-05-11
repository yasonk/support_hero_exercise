require 'rails_helper'

describe SupportAssignmentsController, type: :controller do
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
    context 'when user_id is not passed in with request params' do
      before {get :index}
      it 'assigns all support assignments as @support_assignments' do
        expect(assigns(:support_assignments).count).to eq 6
      end
    end

    context 'when user_id is passed in with request params' do
      before {get :index, {user_id: 1}}
      it 'assigns the support assignments' do
        expect(assigns(:support_assignments).count).to eq 3
      end
    end
  end

  describe 'GET #today' do
    it 'responds with the name of the person on duty today' do
      get :today
      expect(assigns(:support_assignment).user.name).to eq 'Yason'
    end
  end

end
