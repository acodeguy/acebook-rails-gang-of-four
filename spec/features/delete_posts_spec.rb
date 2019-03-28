require 'rails_helper'

RSpec.feature "Delete Posts", type: :feature do
  scenario "Can delete a post from the timeline" do
    user = sign_up_and_sign_in
    create_post(message: 'This is a post', user_id: user.id)
    p "page.current_path #{page.current_path}"
    p page.body
    click_button "Delete"
    expect(page).not_to have_content('This is a post')
  end
end