require 'spec_helper'

describe "user signup" do
  it "is successful" do
    visit new_user_path
    fill_in "user_username", with: Faker::Name.name
    fill_in "user_email", with: Faker::Internet.email
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create account"
    page.should have_content "Logout"
  end
end

describe "profile page" do
  let(:client) { FactoryGirl.create(:user, :photographer => false) }
  let(:photographer) { FactoryGirl.create(:user, :photographer => true) }

  let(:contest) { FactoryGirl.create(:contest, :creator_id => client.id) }
  let(:photo) { FactoryGirl.create(:photo, :user_id => photographer.id) }

  context "is client"
  it "shows all contests" do
    visit new_session_path
    fill_in "user_email", with: client.email
    fill_in "user_password", with: client.password
    click_button "Sign in"
    page.should have_content contest.title
  end

  context "is photographer"
  it "shows all photos" do
    visit new_session_path
    fill_in "user_email", with: photographer.email
    fill_in "user_password", with: photographer.password
    click_button "Sign in"
    page.should have_content photo.description
  end
end
