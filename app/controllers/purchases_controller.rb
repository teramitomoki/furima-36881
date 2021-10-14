class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  
  def index
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
    if current_user == @item.user
      redirect_to root_path
    end
    if @purchase_shipping != current_user.id
      redirect_to root_path
    end

  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      # Payjp.api_key = "sk_test_26d8d68ecf668cc6b1fb58c8"
      # Payjp::Charge.create(
      #   amount: purchase_shipping_params[:price],
      #   card: purchase_shipping_params[:token],
      #   currency: 'jpy'
      # )
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
