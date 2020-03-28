class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @like = Like.new
    @post = Post.find_by(id: params[:id])
    @posts = Post.find_by(params[:id])
    @user = User.find_by(id: @posts.user_id)
    @comments = @post.comments.includes(:user).all
    @comment = @post.comments.build(user_id: current_user.id) if current_user
    @commentss = @post.comments.build
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

    if params[:tag]
      @users = User.tagged_with(params[:tag])
    else
      @users = User.all
    end
  end

  def night
     @spot = Post.tagged_with("night")
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
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_index_path, notice: '投稿しました'
    else
      render 'pages/about'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :content, :tag_list)
  end
end
