class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    # Item.create(item_params)
    @aitem = Item.new(article_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
