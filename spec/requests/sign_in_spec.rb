require 'rails_helper'

RSpec.feature "Sign_In", type: :feature do

  scenario "Can sign in if email is valid" do
    create_user_and_sign_in
    expect(page).to have_content("Signed in successfully")
  end

  scenario "Redirects to login page if user is not signed in" do
    visit "/posts"
    expect(page).to have_content("Log in")
  end

  scenario "Redirects to sign up page when user selects sign up" do
    visit "/users/sign_in"
    click_on('Sign up')
    expect(page.current_path).to eq('/users/sign_up')
  end
end