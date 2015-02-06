require 'rails_helper'

describe User do
  it "should allow someone to sign up with their name, email, and password" do
    @user = create(:user)
  end
end
