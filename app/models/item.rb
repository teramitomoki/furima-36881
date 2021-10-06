class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :estimated_shipping_date

  validates :product, :description, :price, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :estimated_shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end
