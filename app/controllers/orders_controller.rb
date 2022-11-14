class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.create(order_address_params)
    if @order_address.valid?
      # pay_item
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_address_params[:price],
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

end
