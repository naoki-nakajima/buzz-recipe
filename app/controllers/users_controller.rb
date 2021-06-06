class UsersController < ApplicationController

  def index
    @post = Post.find_by(params[:post_id])
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.includes(:photos, :user).order('created_at DESC').page(params[:page]).per(5)
    @post = Post.find_by(params[:post_id])
  end

  def edit
    @post = Post.find_by(params[:post_id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
