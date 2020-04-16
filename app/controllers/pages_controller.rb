class PagesController < ApplicationController

  def index
  end

  def show
  end

  def home
    @post = Post.all.order(created_at: :desc).page(params[:page])
    @posts = Post.find_by(params[:id])
    @postss = Post.find_by(id: params[:id])
  end

end
