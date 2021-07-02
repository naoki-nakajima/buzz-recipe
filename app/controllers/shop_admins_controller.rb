class ShopAdminsController < ApplicationController

  def index
    @posts = Post.includes(:photos, :shop_admin).order('created_at DESC').page(params[:page]).per(5)
    @shop_commitment = ShopCommitment.new
  end

  

  def show
    @posts = Post.includes(:photo, :shop_admin).order('created_at DESC').page(params[:page]).per(5)
  end
end
