require 'rails_helper'

RSpec.feature "Delete post", type: :request do
  before do
    user_auth = register

    post = Post.create(message: "A post, yo!", user_id: user_auth[:user_id])

    delete "/posts/#{post.id}", params: { 
      id: post.id,       
      'access-token': user_auth[:token], 
      client: user_auth[:client], 
      uid: user_auth[:email]  
    }
  end
  
  scenario "Returns 204 status when post deleted" do
    expect(response.status).to eq(204)
  end

  scenario "Removes post from database" do
    expect(Post.all).to eq([])
  end
end