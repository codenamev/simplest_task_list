require 'spec_helper'

describe "UserLoginWithEmails" do
  it "logins in a user with just an email address" do
    user = Factory(:user)
    visit login_path
    fill_in "Email", :with => user.email
    click_button "Signup"
  end
end