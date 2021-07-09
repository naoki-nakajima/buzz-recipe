class PostsController < ApplicationController
  
  def index
    @shop_infos = ShopInfo.includes(:shop_admin).page(params[:page]).per(5)
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

  def search
    @posts = Post.search(params[:keyword]).includes(:photos, :user).order('created_at DESC').page(params[:page]).per(5)
    @post = Post.find_by(params[:post_id])
    #respond_to do |format|
      #format.html
      #format.json
    #end
  end

  def hashtag
    @user = current_user
    @tag =  Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end
end
