FactoryBot.define do
  factory :order_address do
    token  { "tok_abcdefghijk00000000000000000" }
    post_code { "123-0001" }
    prefecture_id { "20" }
    municipality { "札幌市中央区" }
    address { "大通西10-4-124" }
    building_name { "ライオンズマンション第５大通７０２号室" }
    phone_number {"08012341234"}
    # association :user, factory: :user
    # association :item, factory: :item
  end
end
