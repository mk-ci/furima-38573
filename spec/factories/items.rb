FactoryBot.define do
  factory :item do
    item_name            { 'name' }
    explanation          { 'text' }
    category_id          { '3' }
    condition_id         { '2' }
    shipping_charge_id   { '2' }
    prefecture_id        { '36' }
    days_to_ship_id      { '2' }
    price                { '40000' }
    association :user, factory: :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/shimane.jpg'), filename: 'shimane.png')
    end
  end
end
