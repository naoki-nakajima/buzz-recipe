class Hashtag < ApplicationRecord
  has_many :post_hashtag_relations
  has_many :posts, through: :post_hashtag_relations
  validates :hashname, presence: true, length: {maximum:99}
end
