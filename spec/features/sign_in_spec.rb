require 'rails_helper'

RSpec.feature "Sign_In", type: :feature do
  scenario "Can Sign In" do
    User.create(email: "simon@simon.com", password: "secrets", password_confirmation: "secrets")

    visit "/users/sign_in"
    
    fill_in "user_email", with: "simon@simon.com"
    fill_in "user_password", with: "secrets"

    click_button "Log in"
    expect(page).to have_content("Signed in successfully")
  end
end