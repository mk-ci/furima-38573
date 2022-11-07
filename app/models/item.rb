class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_many :comments
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :item_name, :explanation, :price, :user
    validates :category_id, :condition_id, :shipping_charge_id,:prefecture_id, :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  end

  # def was_attached?
  #   self.image.attached?
  # end
end
