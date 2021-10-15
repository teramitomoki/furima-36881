FactoryBot.define do
  factory :item do
    product                    { 'テスト商品' }
    description                { Faker::Lorem.sentence }
    category_id                { 2 }
    condition_id               { 2 }
    shipping_charge_id         { 2 }
    prefecture_id              { 34 }
    estimated_shipping_date_id { 2 }
    price                      { '9999' }

    # trait :image do
      after(:build) do |item|
        # File.open("#{Rails.root}/spec/images/test_image.jpeg") do |f|
          item.image.attach(io: File.open('spec/fixtures/sample.png'), filename: 'sample.png', content_type: 'image/png')
        # end
      end
    # end
  end
end
