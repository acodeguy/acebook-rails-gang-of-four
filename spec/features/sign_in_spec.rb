require 'rails_helper'

RSpec.feature "Sign_In", type: :feature do

  scenario "Can Sign In" do
    sign_up_and_sign_in
    expect(page).to have_content("Signed in successfully")
  end

  scenario "User is not signed in" do
    visit "/posts"
    expect(page).to have_content("Log in")
  end
end