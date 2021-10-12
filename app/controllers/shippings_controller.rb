class ShippingsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(shipping_params)
  end

  private
  def shipping_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
