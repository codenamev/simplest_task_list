require 'spec_helper'

describe "UserSignsupWithEmails" do
  it "signs up a user with just their email address" do
    user = Factory(:user)
    visit signup_path
    fill_in "Email", :with => user.email
    click_button "Sign Up"
    #current_path.should eq(user_tasks_path)
    page.should have_content("igned up")
  end
  it "signs up a user that already exists" do
    user = Factory(:user)
    visit signup_path
    fill_in "Email", :with => user.email
    click_button "Sign Up"
    #current_path.should eq(user_tasks_path)
    page.should have_content("You've already signed up")
  end
end