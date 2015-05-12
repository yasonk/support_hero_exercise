require 'rails_helper'

describe User do

  let!(:user) { User.create name: 'Yason' }
  let!(:user2) { User.create name: 'Lucas' }

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

  describe '#unavailable_date=' do
    context 'when user has assignment on the unavailable date' do
      before do
        user.support_assignments.create! date: Date.today
        user2.support_assignments.create! date: Date.tomorrow
      end

      it 'removes the assignment from the user' do
        user.unavailable_date= Date.today
        expect(SupportAssignment.where(date: Date.today, user_id: user.id)).not_to exist
      end

      it 'assigns another user to pick up the assignment' do
        user.unavailable_date= Date.today
        expect(SupportAssignment.where(date: Date.today, user_id: user2.id)).to exist
      end

      context 'when no substitute user can be found' do
        before do
          user2.unavailable_date= Date.today
          user2.save!
        end
        it 'keeps everything unchanged' do
          user.unavailable_date= Date.today
          expect(SupportAssignment.where(date: Date.today, user_id: user.id)).to exist
          expect(user.unavailable_date).to be_nil
        end
      end
    end


  end
end