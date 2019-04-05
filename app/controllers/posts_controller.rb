class PostsController < ApplicationController

  def create
    user = User.find(post_params[:user_id])
    @post = user.posts.create(post_params)
    render json: @post
  end

  def index
    @posts = Post.order("created_at DESC").all
    render json: @posts, :include => {:user => {:only => :email}} 
  end

  def update
    post = Post.find(post_params[:id])
    post.update(post_params, current_user)
  end

  def destroy
    Post.destroy(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :id)
  end
end
