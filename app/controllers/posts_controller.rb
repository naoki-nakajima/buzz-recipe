class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i(new ceate edit update shoe delete)
  before_action :set_post, only: %i(edit update destroy search)
  
  def index
    @posts = Post.includes(:photos, :shop_admin).order('created_at DESC').page(params[:page]).per(5)
    @post = Post.find_by(params[:post_id])
    @get_post = Post.find_by(params[:post_id])
  end

  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def show
    @posts = Post.limit(10).includes(:photos, :shop_admin).order('created_at DESC')
    @post = Post.find_by(params[:post_id])
  end

  def destroy
    @post.user == current_user
    @post.destroy
    redirect_to root_path
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

  private
    def post_params
      params.require(:post).permit(:title, :caption, :price, :post_comment, photos_attributes: [:id, :image]).merge(shop_admin_id: current_shop_admin.id)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end
end
