class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post= current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    p "we are here!"
    p "posts #{@posts}"
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to posts_url
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
