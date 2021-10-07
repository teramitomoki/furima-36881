FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name { '寺見' }
    first_name { '友基' }
    last_name_kana { 'テラミ' }
    first_name_kana { 'トモキ' }
    birthday { '1996/2/1' }
  end
end
