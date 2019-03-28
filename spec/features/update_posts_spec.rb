require 'rails_helper'

RSpec.feature "Update Posts", type: :feature do
  scenario "Can update a post from the timeline" do
    user = create_user_and_sign_in
    create_post(message: 'This is a post', user_id: user.id)

    click_button "Update"
    fill_in "Message", with: 'Post updated'
    click_button "Submit" 
    
    expect(page).to have_content('Post updated')
  end

  scenario 'Cannot update the posts of other users' do
    user1 = create_user(email: 'user1@example.com', password: 'password')
    create_post(message: 'User One has written this.', user_id: user1.id)
    user2 = create_user_and_sign_in
    expect(page).not_to have_selector('.update')
  end

end