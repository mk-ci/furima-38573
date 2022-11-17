class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_many :comments
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :image
    validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id,
              numericality: { other_than: 1, message: "を入力してください" }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
end
