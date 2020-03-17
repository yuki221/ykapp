class UsersController < ApplicationController
  def new
  end

  def show
     @user = User.find(params[:id])
     @following = @user.followings
  end

  def index
    @users = User.all.order(created_at: :desc)
    @user = User.find_by(params[:id])
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
 end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
