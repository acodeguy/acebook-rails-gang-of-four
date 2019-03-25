require 'rails_helper'

RSpec.feature "Registration", type: :feature do
  scenario "Can register" do
    visit "/users/sign_up"
    
    fill_in "user_email", with: "simon@simon.com"
    fill_in "user_password", with: "secrets"
    fill_in "user_password_confirmation", with: "secrets"

    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully")
  end
end
