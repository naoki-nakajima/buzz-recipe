class MenusController < ApplicationController

  def new
    @menu = Menu.new
    @post.build_photo
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save!
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @menu = Menu.find_by(params[id: params[:id]])
  end

  def update
    if @menu.update(menu_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @menu = Menu.find_by(params[:menu_id])
    @menu.destroy
    redirect_to root_path
  end

  private
    def menu_params
      params.require(:menu).permit(:name, :price, :caption).merge(shop_admin_id: current_shop_admin.id)
    end
end
