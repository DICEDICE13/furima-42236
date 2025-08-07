FactoryBot.define do
  factory :item do
    name                  { 'テスト商品' }
    description           { '説明文' }
    price                 { 1000 }
    category_id           { 2 }
    status_id             { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id         { 2 }
    delivery_day_id       { 2 }

    # userとのアソシエーション（FactoryBotで生成）
    association :user

    # ActiveStorageの画像設定（テスト用画像）
  after(:build) do |item|
    item.image.attach(
     io: StringIO.new("dummy image data"),
     filename: 'test.png',
     content_type: 'image/png'
    )
  end
  end
end