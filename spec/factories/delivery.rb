FactoryBot.define do
    factory :delivery do
        purchaser_name { Faker::Name.first_name }
        item_description { Faker::Name.first_name }
        item_price { Faker::Number.decimal(l_digits: 2) }
        purchase_count { Faker::Number.number(digits: 3) }
        merchant_address { Faker::Address.street_address }
        merchant_name { Faker::Name.first_name }
    end
end