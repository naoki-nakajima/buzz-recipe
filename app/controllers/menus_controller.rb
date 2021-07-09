class MenusController < ApplicationController
  
  def new
    @new_menu = Menu.new
    @new_menu.build_photo
  end

  def create
    @menu = Menu.create(menu_params)
    if @menu.photo.present?
      @menu.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to root_path
  end

  private
    def menu_params
      params.require(:menu).permit(:name, :price, :caption, photo_attributes: [:id, :image]).merge(shop_admin_id: current_shop_admin.id)
    end
end
