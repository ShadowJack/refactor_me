require 'rails_helper'

describe User, :type => :model do
  before(:each) { @user = create(:user) }

  it "#username returns a string" do
    expect(@user.username).to match "test_user"
  end

end
