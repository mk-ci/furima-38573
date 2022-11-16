FactoryBot.define do
  factory :user do
    nickname              { 'test1' }
    email                 { 'test1@example' }
    password              { '00001a' }
    password_confirmation { password }
    first_name            { '山本' }
    last_name             { '太郎' }
    first_kana            { 'ヤマモト' }
    last_kana             { 'タロウ' }
    birthday              { '2001-01-01' }
  end
end
