class ShopInfosController < ApplicationController
  before_action :authenticate_shop_admin!, only: %i(new create edit update show destroy)

  def new
    @shop_info = ShopInfo.new
  end

  def create
    @shop_info = ShopInfo.new(shop_info_params)
    if @shop_info.save
      redirect_to root_path
    else
      redirect_to  shop_admins_path
    end
  end

  def edit
    @shop_info = ShopInfo.find(params[:id])
  end

  def update
    @shop_info = ShopInfo.find(params[:id])
    if @shop_info.update(shop_info_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
  end

  def destroy
    @shop_info = ShopInfo.find(params[:id])
    @shop_info.destroy
  end

  private
    def shop_info_params
      params.require(:shop_info).permit(:store_name, :address, :email, :phone_number, :caption).merge(shop_admin_id: current_shop_admin.id)
    end
end
