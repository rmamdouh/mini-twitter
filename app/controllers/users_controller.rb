class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params['id'])
    @posts = @user.posts.order("created_at DESC")
  end

  def destroy
    @user = User.find(params['id'])
    @posts = @user.posts
  end

end
