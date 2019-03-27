require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up_and_sign_in
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit" 
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit multiple posts and view them in descending date" do
    sign_up_and_sign_in
    create_post(message: 'This is the first post')
    create_post(message: 'This is the second post')
    expect(page.first('.post')).to have_content('This is the second post')
  end

  scenario "Can submit a submit and view a post with multiple lines" do
    sign_up_and_sign_in
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!\nI am on a new line"
    click_button "Submit" 
    expect(page).to have_text("Hello, world!\nI am on a new line", :exact)
  end

end
