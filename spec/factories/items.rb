FactoryBot.define do
  factory :item do
    product                    { 'テスト商品' }
    description                { Faker::Lorem.sentence }
    category_id                { 1 }
    condition_id               { 1 }
    shipping_charge_id         { 1 }
    prefecture_id              { 34 }
    estimated_shipping_date_id { 1 }
    price                      { '9999' }

    trait :image do
      after(:build) do |item|
        File.open("#{Rails.root}/spec/images/test_image.jpeg") do |f|
          item.images.attach(io: f, filename: 'test_image.jpeg', content_type: 'image/jpeg')
        end
      end
    end
  end
end
