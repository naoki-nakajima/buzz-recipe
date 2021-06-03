class UsersController < ApplicationController

  def index
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.includes(:photos, :user).order('created_at DESC').page(params[:page]).per(5)
    @post = Post.find_by(params[:post_id])
  end
end
