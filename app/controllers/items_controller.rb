class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :estimated_shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
