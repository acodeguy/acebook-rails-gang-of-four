require 'rails_helper'

RSpec.feature "Update Posts", type: :feature do
  scenario "Can update a post from the timeline" do
    sign_up_and_sign_in
    create_post(message: 'This is a post')

    click_button "Update"
    fill_in "Message", with: 'Post updated'
    click_button "Submit" 
    
    expect(page).to have_content('Post updated')
  end
end