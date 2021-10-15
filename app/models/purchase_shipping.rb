class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipalities
    validates :address
    validates :user_id
    validates :item_id
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address,
                    building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end
