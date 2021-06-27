class BusinessDate < ApplicationRecord
  belongs_to :shop_admin
  has_many :business_times, dependent: :destroy
end
