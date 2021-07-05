class ShopAdmins::PostsController < ShopAdmins::ApplicationController
  before_action :authenticate_shop_admin!, only: %i(new create edit update shoe delete)
  def index
    @posts = Post.includes(:shop_admin).order('created_at DESC').page(params[:page]).per(5)
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
