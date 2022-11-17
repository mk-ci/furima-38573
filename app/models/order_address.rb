class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id, :user_id,
                :item_id

  with_options presence: true do
    validates :token, :municipality, :address, :user_id, :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は-（ハイフン）を入れて入力してください" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は-（ハイフン）を除いて半角で入力してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください"}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
