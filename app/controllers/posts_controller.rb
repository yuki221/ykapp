class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @like = Like.new
    @post = Post.find_by(id: params[:id])
    @posts = Post.find_by(params[:id])
    @user = User.find_by(id: @posts.user_id)
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to root_path
  end

  def index
    @post = Post.all
    @posts = Post.find_by(params[:id])
    @user = User.find_by(id: @posts.user_id)
  end

  def night
     @spot = Post.tagged_with("nights")
     @post = Post.all
     @posts = Post.find_by(params[:id])
     @user = User.find_by(id: @posts.user_id)
  end

  def cafe
     @spot = Post.tagged_with("cafe")
     @post = Post.all
     @posts = Post.find_by(params[:id])
     @user = User.find_by(id: @posts.user_id)
  end

  def sweets
     @spot = Post.tagged_with("sweets")
     @post = Post.all
     @posts = Post.find_by(params[:id])
     @user = User.find_by(id: @posts.user_id)
  end

  def dinner
     @spot = Post.tagged_with("dinner")
     @post = Post.all
     @posts = Post.find_by(params[:id])
     @user = User.find_by(id: @posts.user_id)
  end

  def create
    @post = current_user.posts.build(
      post_params)
    if @post.save
      redirect_to root_path, notice: '投稿しました'
    else
      render 'pages/about'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
