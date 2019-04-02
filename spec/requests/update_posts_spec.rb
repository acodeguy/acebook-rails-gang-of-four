require 'rails_helper'

RSpec.feature "Update Posts", type: :feature do
  scenario "Can update a post from the timeline" do
    user = create_user_and_sign_in
    create_then_view_posts(message: 'This is a post', user_id: user.id)

    click_button "Update"
    fill_in "Message", with: 'Post updated'
    click_button "Submit" 
    
    expect(page).to have_content('Post updated')
  end

  scenario 'Cannot update the posts of other users' do
    user1 = create_user(email: 'user1@example.com', password: 'password')
    create_then_view_posts(message: 'User One has written this.', user_id: user1.id)
    create_user_and_sign_in
    expect(page).not_to have_selector('.update')
  end

  scenario 'Cannot update a post after 10 minutes' do
    user = create_user_and_sign_in
    ten_mins_ago = DateTime.now - (1 / 24.0 / 6)
    Post.create(message: 'Message with a given timestamp', user_id: user.id, created_at: ten_mins_ago)
    visit '/posts'
    expect(page).not_to have_selector('.update')
  end
end