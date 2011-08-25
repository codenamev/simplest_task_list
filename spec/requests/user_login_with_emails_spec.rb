require 'spec_helper'

describe "UserLoginWithEmails" do
  it "logins in a user with just an email address" do
    user = Factory(:user)
    visit login_path
    fill_in "Email", :with => user.email
    click_button "Sign in"
  end
  it "logs out a user" do
    user = Factory(:user)
    visit login_path
    fill_in "Email", :with => user.email
    click_button "Sign in"
    visit logout_path
    page.should have_content("Logged out!")
  end
end