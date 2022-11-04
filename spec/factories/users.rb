FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'00000a'}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'陸太郎'}
    first_kana            {'ヤマダ'}
    last_kana             {'リクタロウ'}
    birthday              {'2000-01-01'}
  end
end