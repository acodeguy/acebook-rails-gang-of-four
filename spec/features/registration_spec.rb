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

  scenario 'Password must be more than 6 characters in length' do

    visit "/users/sign_up"
    
    fill_in "user_email", with: "simon@simon.com"
    fill_in "user_password", with: "sec"
    fill_in "user_password_confirmation", with: "sec"

    click_button "Sign up"
    expect(page).to have_content('Password is too short (minimum is 6 characters)')

  end

  scenario "Email must be a valid email address" do
    visit "/users/sign_up"
    
    fill_in "user_email", with: "simon.com"
    fill_in "user_password", with: "secrets"
    fill_in "user_password_confirmation", with: "secrets"

    click_button "Sign up"
    expect(page).to have_content('Email is invalid')
  end

end
