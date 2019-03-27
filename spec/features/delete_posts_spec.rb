require 'rails_helper'

RSpec.feature "Delete Posts", type: :feature do
  scenario "Can delete a post from the timeline" do
    sign_up_and_sign_in
    create_post(message: 'This is a post')
    click_button "Delete"
    expect(page).not_to have_content('This is a post')
  end
end