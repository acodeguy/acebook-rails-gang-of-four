class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

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
    post = Post.find(params[:id])
    post.update(post_params, current_user)
    redirect_to posts_url
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
