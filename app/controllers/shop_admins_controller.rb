class ShopAdminsController < ApplicationController 
  def index
    @shop_admin = current_shop_admin

    @shop_info = ShopInfo.new

    @business_date = BusinessDate.new
    
    @new_menu = Menu.new
    menus = Menu.includes(:shop_admin, :photo).order('created_at DESC').page(params[:page]).per(10)
    @shop_admin_menus = current_shop_admin.menus

    @shop_commitment = ShopCommitment.new
    commitments = ShopCommitment.includes(:shop_admin, :commitment_photo).order('created_at DESC')
    @shop_commitments = commitments
  end

  def show
    @shop_infos = ShopInfo.includes(:shop_admin)
    @business_dates = BusinessDate.includes(:shop_admin)
    @menus = Menu.includes(:shop_admin, :photo).order('created_at DESC').page(params[:page]).per(10)
    @shop_commitments = ShopCommitment.includes(:shop_admin, :commitment_photo).order('created_at DESC')
  end
  
end
