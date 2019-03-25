require 'rails_helper'

RSpec.feature "Registration", type: :feature do
  scenario "Can register" do
    visit "/users/new"
    fill_in "Email", with: "simon@simon.com"
    fill_in "Password", with: "secrets"
    click_button "Submit"
    expect(page).to have_content("Welcome to Acebook!")
  end
end
