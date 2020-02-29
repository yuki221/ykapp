class PagesController < ApplicationController

  def index
  end

  def show
  end

  def home
    @post = Post.all
    @posts = Post.find_by(params[:id])
    @user = User.find_by(id: @posts.user_id)
  end

end
