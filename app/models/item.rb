class Item < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :item_name, :explanation, :category_id, :condition_id, :shipping_charge_id,:prefecture_id, :days_to_ship_id, :price, :user
  end

end
