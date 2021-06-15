class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i(show search)
  
  def index
    @posts = Post.includes(:photos, :shop_admin).order('created_at DESC').page(params[:page]).per(5)
    @post = Post.find_by(params[:post_id])
  end

  

  def show
    @posts = Post.limit(10).includes(:photos, :shop_admin).order('created_at DESC')
    @post = Post.find_by(params[:post_id])
  end

  def search
    @posts = Post.search(params[:keyword]).includes(:photos, :shop_admin).order('created_at DESC').page(params[:page]).per(5)
    @post = Post.find_by(params[:post_id])
  end

  def hashtag
    @user = current_user
    @tag =  Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end

  private
    def post_params
      params.require(:post).permit(:title, :caption, :price, photos_attributes: [:id, :image]).merge(shop_admin_id: current_user.id)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end
end
