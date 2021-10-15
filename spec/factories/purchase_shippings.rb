FactoryBot.define do
  factory :purchase_shipping do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '08099990000' }
    token { 'tok_7387493894353098093' }
  end
end
