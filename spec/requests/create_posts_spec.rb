require 'rails_helper'

RSpec.feature "Create post", type: :request do
  before do
    user_auth = register

    post '/posts', params: { 
      post: { message: 'New post', user_id: user_auth[:user_id] }, 
      'access-token': user_auth[:token], 
      client: user_auth[:client], 
      uid: user_auth[:email] 
    }
  end
  
  scenario "Returns 200 status when post created" do
    expect(response.status).to eq(200)
  end

  scenario "Creates post in database" do
    expect(Post.all[0].message).to eq('New post')
  end
end
