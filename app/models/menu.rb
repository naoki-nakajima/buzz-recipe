class Menu < ApplicationRecord
  belongs_to :shop_admin
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true
end
