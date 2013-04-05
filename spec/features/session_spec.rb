require 'spec_helper'


describe "user login", :js => true do
  let(:user) { FactoryGirl.create(:user) }

  it "is successful" do
    visit new_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Sign in"
    page.should have_content "Welcome"
  end

  it "logs out" do
    visit new_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Sign in"
    click_link "Logout"
    page.should have_content "Sign"
  end

end
