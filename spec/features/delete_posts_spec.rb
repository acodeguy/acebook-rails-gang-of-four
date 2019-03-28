require 'rails_helper'

RSpec.feature "Delete Posts", type: :feature do
  scenario "Can delete a post from the timeline" do
    user = create_user_and_sign_in
    create_then_view_posts(message: 'This is a post', user_id: user.id)
    click_button "Delete"
    expect(page).not_to have_content('This is a post')
  end

  scenario 'Cannot delete the posts of other users' do
    user1 = create_user(email: 'user1@example.com', password: 'password')
    create_then_view_posts(message: 'User One has written this.', user_id: user1.id)
    user2 = create_user_and_sign_in
    expect(page).not_to have_selector('.delete')
  end
end