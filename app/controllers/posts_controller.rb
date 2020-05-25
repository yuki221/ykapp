class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show cafe night sweets dinner themepark nature index]
  before_action :login_required, only: [:new]
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
    @items = Post.page(params[:page]).per(12)
    if params[:tag]
      @users = User.tagged_with(params[:tag])
    else
      @users = User.all
    end
  end

  def night
    @spot = Post.tagged_with('night')
    @post = Post.all
    @posts = Post.find_by(params[:id])
    @user = User.find_by(id: @posts.user_id)
  end

  def cafe
    @spot = Post.tagged_with('cafe')
    @post = Post.all
    @posts = Post.find_by(params[:id])
    @user = User.find_by(id: @posts.user_id)
  end

  def sweets
    @spot = Post.tagged_with('sweets')
    @post = Post.all
    @posts = Post.find_by(params[:id])
    @user = User.find_by(id: @posts.user_id)
  end

  def dinner
    @spot = Post.tagged_with('dinner')
    @post = Post.all
    @posts = Post.find_by(params[:id])
    @user = User.find_by(id: @posts.user_id)
  end

  def themepark
    @spot = Post.tagged_with('theme')
    @post = Post.all
    @posts = Post.find_by(params[:id])
    @user = User.find_by(id: @posts.user_id)
  end

  def nature
    @spot = Post.tagged_with('shopping')
    @post = Post.all
    @posts = Post.find_by(params[:id])
    @user = User.find_by(id: @posts.user_id)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path, notice: '投稿しました'
    elsif @post.title.empty?
      render 'new',
      alert: '施設名を入力してください'
        elsif @post.body.empty?
          render 'new',
          alert: '内容を入力してください'
            elsif @post.tag_list.empty?
              render 'new',
              alert: 'タグを選択してください'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :content, :tag_list)
  end

  def login_required
    redirect_to login_path unless current_user
  end
end
