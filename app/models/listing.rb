class Listing < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :product, :description, :price, presence: true

  validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :estimated_shipping_date_id, numericality: { other_than: 1 } 
end
