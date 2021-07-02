class ShopAdmins::PostsController < ShopAdmins::ApplicationController
  before_action :authenticate_shop_admin!, only: %i(new create edit update shoe delete)
  def index
    @posts = Post.includes(:photos, :shop_admin).order('created_at DESC').page(params[:page]).per(5)
    @get_post = Post.find_by(params[:post_id])
    
    @post = Post.new
    @post.photos.build

    @shop_info = ShopInfo.new

    @business_date = BusinessDate.new

    @shop_commitment = ShopCommitment.new
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
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      render :new
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def show
    @posts = Post.limit(10).includes(:photos, :shop_admin).order('created_at DESC')
    @post = Post.find_by(params[:post_id])
    @get_post = Post.find_by(params[:post_id])
  end

  def destroy
    if @post.shop_admin == current_shop_admin
      @post.destroy
      flash[:notice] = "投稿が削除されました" if @post.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to root_path
  end

  def search
    @posts = Post.search(params[:keyword]).includes(:photos, :user).order('created_at DESC').page(params[:page]).per(5)
    @post = Post.find_by(params[:post_id])
  end

  def hashtag
    @user = current_user
    @tag =  Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end

  private
    def set_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.permit(:title, :price, :caption, photos_attributes: [:id, :image]).merge(shop_admin_id: current_shop_admin.id)
    end

    def shop_info_params
      params.require(:shop_info).permit(:store_name, :address, :email, :phone_number, :caption).merge(shop_admin_id: current_shop_admin.id)
    end
end
