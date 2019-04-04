require 'rails_helper'

RSpec.feature "Update Posts", type: :request do

  before do
    user_auth = register

    Post.create(message: "A post, yo!", user_id: user_auth[:user_id])

    @posts = Post.all
    @id = @posts.first.id

    patch "/posts/#{@id}", params: { 
      post: { message: 'Post updated', id: @id }, 
      'access-token': user_auth[:token], 
      client: user_auth[:client], 
      uid: user_auth[:email] 
    }

    @post = Post.find(@id)
  end

  scenario "Can update a post from the timeline" do 
    expect(@post.message).to eq 'Post updated'
  end
end