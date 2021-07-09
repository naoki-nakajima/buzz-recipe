class ShopAdmins::PostsController < ShopAdmins::ApplicationController
  before_action :authenticate_shop_admin!, only: %i(new create edit update shoe delete)
  def index
    @menus = Menu.includes(:shop_admin, :photo).order('created_at DESC').page(params[:page]).per(10)
  end

  def new
    
  end

  def create
    
  end

  def edit
    
  end

  def update
   
  end

  def show
    
  end

  def destroy
    
  end
end
