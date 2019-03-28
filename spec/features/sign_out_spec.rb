require 'rails_helper'

RSpec.feature "sign out", type: :feature do

  scenario "Can sign out" do
    sign_up_and_sign_in
    click_button("Log out")
    expect(page).to have_content("You need to sign in or sign up before continuing")
    expect(page).to have_button("Log in")
  end

end