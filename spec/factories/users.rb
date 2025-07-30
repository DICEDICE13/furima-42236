FactoryBot.define do
  factory :user do
    nickname              { 'テスト' }  # ← ✅ 6文字以内に修正（例：3文字）
    email                 { Faker::Internet.unique.email }
    password              { 'password123' }
    password_confirmation { 'password123' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end
