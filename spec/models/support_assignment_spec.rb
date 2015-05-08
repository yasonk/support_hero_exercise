require 'rails_helper'

describe SupportAssignment do

  let!(:user) { User.create name: 'Yason' }
  let!(:assignment) { SupportAssignment.create date: Date.today, user_id: user.id}

  describe '#available?' do
    context 'when the user is available for all dates' do
      it 'returns true' do
        expect(user.available? Date.today).to be true
      end
    end

    context 'when user marked today as unavailable' do
      before { user.unavailable_date = Date.today }
      it "returns false for today's date" do
        expect(user.available? Date.today).to be false
      end

      it "returns true for tomorrow's date" do
        expect(user.available? Date.tomorrow).to be true
      end
    end
  end

  describe '#schedule' do
    context 'when the user has 3 scheduled support assignments' do
      before do
        3.times do| i |
          user.support_assignments.create date: (Date.today + i)
        end
      end
      it 'returns exactly 3 assignments' do
        expect(user.schedule.count).to be 3
      end
    end
  end
end