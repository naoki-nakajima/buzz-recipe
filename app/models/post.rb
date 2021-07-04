class Post < ApplicationRecord
  belongs_to :shop_admin
  has_one :photo, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :post_hashtag_relations
  
  accepts_nested_attributes_for :photo, allow_destroy: true
  
  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end

  
end
