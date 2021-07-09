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
    @shop_commitment = ShopCommitment.find(params[:id])
  end

  def update
    @shop_commitment = ShopCommitment.find(params[:id])
    if @shop_commitment.update(shop_commitment_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  

  def destroy
    @shop_commitment = ShopCommitment.find(params[:id])
    @shop_commitment.destroy
    redirect_to root_path
  end

  private
    def shop_commitment_params
      params.require(:shop_commitment).permit(:id, :text, commitment_photo_attributes: [:id, :image]).merge(shop_admin_id: current_shop_admin.id)
    end
end
