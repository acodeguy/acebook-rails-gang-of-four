require 'rails_helper'

RSpec.feature "Delete Posts", type: :feature do
  scenario "Can delete a post from the timeline" do
    user = create_user_and_sign_in
    create_then_view_posts(message: 'This is a post', user_id: user.id)
    click_button "Delete"
    expect(page).not_to have_content('This is a post')
  end
end