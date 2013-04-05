require 'spec_helper'

describe "user signup", :js => true do
  it "is successful" do
    visit new_user_path
    fill_in "user_username", with: Faker::Name.name
    fill_in "user_email", with: Faker::Internet.email
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create account"
    page.should have_content "Welcome"
  end
end
