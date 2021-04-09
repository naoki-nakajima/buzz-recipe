class CocksController < ApplicationController
  def new
    @post = Post.new
    @cock = @post.cocks.build
  end
  
  def create
    @post = Post.new(post_params)
    @post.save
  end

  private
    def post_params
      params.require(:post).permit(:title, :caption, :post_comment, cocks_attributes: [:id, :how_to, :_destroy])
    end
end
