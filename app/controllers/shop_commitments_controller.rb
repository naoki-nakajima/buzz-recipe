class ShopCommitmentsController < ApplicationController
  before_action :authenticate_shop_admin!, only: %i(new create edit update destroy)

  def new
    @shop_commintent = ShopCmmitment.new
  end

  def create
    @shop_commintent = ShopCmmitment.new(shop_commitment_params)
    if @shop_commintent.save

    else
      render :new
    end
  end

  def edit
  end

  def updated
  

  def destroy
  end

  private
    def shop_commintemt_params
      params.require(:shop_commitment).permit(:id, :text, photos_attributes: [:id, :image]).merge(shop_admin_id: current_shop_admin.id)
    end
end
