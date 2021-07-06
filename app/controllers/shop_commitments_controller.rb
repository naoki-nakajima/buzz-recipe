class ShopCommitmentsController < ApplicationController
  before_action :authenticate_shop_admin!, only: %i(new create edit update destroy)

  def new
    @shop_commitment = ShopCommitment.new
    @shop_commitment.build_commitment_photo
  end

  def create
    @shop_commitment = ShopCommitment.create(shop_commitment_params)
    if @shop_commitment.save!
      redirect_to root_path
    else
      redirect_to shop_admins_path
    end
  end

  def edit
  end

  def updated
  end
  

  def destroy
  end

  private
    def shop_commitment_params
      params.require(:shop_commitment).permit(:id, :text, commitment_photo_attributes: [:id, :image]).merge(shop_admin_id: current_shop_admin.id)
    end
end
