require 'spec_helper'

  describe "attempting to add contest", :js => true do
    let(:client) { FactoryGirl.create(:user, :photographer => false) }
    let(:photographer) { FactoryGirl.create(:user, :photographer => true) }

    let(:contest) { FactoryGirl.create(:contest, :creator_id => client.id) }
    let(:photo) { FactoryGirl.create(:photo, :user_id => photographer.id) }

    it "shows the add contest form when logged in" do
      login
      visit new_contest_path
      page.should have_content "Submit New Contest"
      fill_in "Title", :with => "Test Title"
      select 'Office', :from => 'contest_category'
      fill_in "Description", :with => "Description"
      fill_in "Price", :with => "500"
      click_button "Submit!"
      page.should have_content "Submissions:"
    end

    it "should not allow a non-integer price" do
      login
      visit new_contest_path
      page.should have_content "Submit New Contest"
      fill_in "Title", :with => "Test Title"
      select 'Office', :from => 'contest_category'
      fill_in "Description", :with => "Description"
      fill_in "Price", :with => "bacon pancakes"
      click_button "Submit!"
      page.should have_content "Price must be greater than 0"
    end

    it "should redirect user if not logged in" do
      visit new_contest_path
      page.should have_content "You must be logged in to create a contest."
    end
end
