require 'rails_helper'

RSpec.feature "Create post", type: :request do
  scenario "Returns 200 status when post created" do
    email = 't@t.com'
    post '/auth', params: { email: email, password: '123456', password_confirmation: '123456' }
    token = response.header['access-token']
    client = response.header['client']
    user_id = JSON.parse(response.body)['data']['id']

    post '/posts', params: { post: { message: 'New post', user_id: user_id }, 'access-token': token, client: client, uid: email }
    expect(response.status).to eq(200)
  end
end

# RSpec.feature "Timeline", type: :feature do
#   scenario "Can submit posts and view them" do
#     create_user_and_sign_in
#     visit "/posts"
#     click_link "New post"
#     fill_in "Message", with: "Hello, world!"
#     click_button "Submit" 
#     expect(page).to have_content("Hello, world!")
#   end

#   scenario "Can submit multiple posts and view them in descending date" do
#     user = create_user_and_sign_in
#     create_then_view_posts(message: 'This is the first post', user_id: user.id)
#     create_then_view_posts(message: 'This is the second post', user_id: user.id)
#     expect(page.first('.post')).to have_content('This is the second post')
#   end

#   scenario "Displayed post includes posted date" do
#     user = create_user_and_sign_in
#     post = create_then_view_posts(message: 'THEY TOOK OURRRR JAAAABBBS!', user_id: user.id)
#     expected_posted_date = post.created_at.strftime(
#       '%e %B %Y %l:%M %p'
#     )

#     expect(page).to have_content(expected_posted_date)
#   end
# end
