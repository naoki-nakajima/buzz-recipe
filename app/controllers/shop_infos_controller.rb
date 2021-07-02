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
      redirect_to post_shop_admins_posts_path
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
    def shop_info_params
      params.require(:shop_info).permit(:store_name, :address, :email, :phone_number, :caption).merge(shop_admin_id: current_shop_admin.id)
    end
end
