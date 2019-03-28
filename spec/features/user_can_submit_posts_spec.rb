require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    create_user_and_sign_in
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit" 
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit multiple posts and view them in descending date" do
    user = create_user_and_sign_in
    create_then_view_posts(message: 'This is the first post', user_id: user.id)
    create_then_view_posts(message: 'This is the second post', user_id: user.id)
    expect(page.first('.post')).to have_content('This is the second post')
  end

  scenario "Displayed post includes posted date" do
    user = create_user_and_sign_in
    post = create_then_view_posts(message: 'THEY TOOK OURRRR JAAAABBBS!', user_id: user.id)
    expected_posted_date = post.created_at.strftime(
      '%e %B %Y %l:%M %p'
    )

    expect(page).to have_content(expected_posted_date)
  end
end
