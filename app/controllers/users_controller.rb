class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.limit(10).includes(:photos, :user).order('created_at DESC')
  end
end
