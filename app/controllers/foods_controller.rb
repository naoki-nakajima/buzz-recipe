class FoodsController < ApplicationController
  def new
    @post = Post.new
    @food = @post.foods.build
  end
  
  def create
    @post = Post.new(post_params)
    @post.save
  end

  private
    def post_params
      params.require(:post).permit(:caption, foods_attributes: [:id, :ingredient, :quantity, :_destroy])
    end
end
