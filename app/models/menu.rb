class Menu < ApplicationRecord
  belongs_to :shop_admin
  has_one :photo, dependent: :destroy

  accepts_nested_attributes_for :photo, allow_destroy: true
end
