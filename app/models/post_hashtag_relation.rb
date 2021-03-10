class PostHashtagRelation < ApplicationRecord
  belongs_to :post
  belongs_to :hashtag
  with_options presence: true do
    validates :post
    validates :hashtag
  end
end
