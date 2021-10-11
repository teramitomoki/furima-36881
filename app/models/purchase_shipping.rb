class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :telephone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
  end
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    user =  User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, last_name: last_name, first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, birth_day: birth_day)
    Item.create(product: product, description: description, category_id: category.id, condition_id: condition.id, shipping_charge_id: shipping_charge.id, prefecture_id: prefecture.id, estimated_shipping_date_id: estimated_shipping_date.id, price: price, user_id: user.id)
  end

end