require 'rails_helper'

describe User do

  let!(:user) { User.create name: 'Yason' }

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
    end
  end
end