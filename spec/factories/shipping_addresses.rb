FactoryBot.define do
  factory :shipping_address do
    order { nil }
    postal_code { "MyString" }
    prefecture_id { 1 }
    city { "MyString" }
    address_line { "MyString" }
    building_name { "MyString" }
    phone_number { "MyString" }
  end
end
