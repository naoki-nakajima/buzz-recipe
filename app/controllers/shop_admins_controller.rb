class ShopAdminsController < ApplicationController

  def index
    @shop_admin = current_shop_admin

    @shop_info = ShopInfo.new

    @business_date = BusinessDate.new

    @shop_commitment = ShopCommitment.new
    
    @new_menu = Menu.new
    menus = Menu.includes(:shop_admin).order('created_at DESC').page(params[:page]).per(10)
    @shop_admin_menus = current_shop_admin.menus
  end

  def show
    @posts = Post.includes(:photo, :shop_admin).order('created_at DESC').page(params[:page]).per(5)
  end
  
end
