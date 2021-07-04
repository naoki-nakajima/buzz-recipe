class ShopAdminsController < ApplicationController

  def index
    posts = Post.includes(:shop_admin).order('created_at DESC').page(params[:page]).per(5)
    @shop_admin_posts = current_shop_admin.posts
    
    @shop_admin = current_shop_admin
    @post = Post.find_by(params[:id])
    
    @menus = Menu.includes(:shop_admin).order('created_at DESC').page(params[:page]).per(5)
  end

  def show
    @posts = Post.includes(:photo, :shop_admin).order('created_at DESC').page(params[:page]).per(5)
  end

  private
    def post_params
      params.permit(:title, :caption, :price, photo_attributes: [:id, :image]).merge(shop_admin_id: current_shop_admin.id)
    end

    def menu_params
      params.require(:menu).permit(:name, :price, :caption).merge(shop_admin_id: current_shop_admin.id)
    end
end
