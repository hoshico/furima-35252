FactoryBot.define do
  factory :user do
    nickname              { 'tarou' }
    email                 { 'sample@gmail.com' }
    password              { 'yasu0205' }
    password_confirmation { 'yasu0205' }
    last_name             { '山田' }
    first_name            { '陸太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    birthday              { '2000-01-01' }
  end
end
