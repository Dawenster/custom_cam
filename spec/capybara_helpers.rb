module CapybaraHelpers
  def login
    visit new_session_path
    fill_in "user_email", with: client.email
    fill_in "user_password", with: client.password
    click_button "Sign in"
  end
end
