class OrdersController < ApplicationController
  def index
    # @order = Order.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  # def address_params
  #   params.permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(order_id: @order.id)
  # end
end
