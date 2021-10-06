class ItemsController < ApplicationController
  def index
    @items = item.all
  end

  def new
    @item = item.new
  end

  def create
    item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :estimated_shipping_date_id, :price)
  end
end
