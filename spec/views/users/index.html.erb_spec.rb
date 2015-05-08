require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "User1"
      ),
      User.create!(
        :name => "User2"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => /User./, :count => 2
  end
end
