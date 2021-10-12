class ShippingsController < ApplicationController

  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
  end

  private
  def shipping_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: item_params[:item_id])
  end
end
