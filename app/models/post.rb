class Post < ApplicationRecord
  belongs_to :user
  belongs_to :shop_admin
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :post_hashtag_relations
  
  accepts_nested_attributes_for :photos
  
  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end

  def self.search(search)
    return Post.all unless search
    Post.where('caption LIKE(?)', "%#{search}%")
  end

  after_create do
    post = Post.find_by(id: self.id)
    hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    post.hashtags = []
    
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end

  before_update do 
    post = Post.find_by(id: self.id)
    post.hashtags.clear
    hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)

    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end
end
