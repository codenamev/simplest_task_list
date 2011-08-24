require 'spec_helper'

describe "UserSignups" do
  it "signs up a user with just their email address" do
    user = Factory(:user)
    visit signup_path
    fill_in "Email", :with => user.email
    click_button "Signup"
    #current_path.should eq(user_tasks_path)
    page.should have_content("Signed up!")
  end
end