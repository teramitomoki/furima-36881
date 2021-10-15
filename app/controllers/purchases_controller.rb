class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: :index
  before_action :purchase_shipping_index, only: :index
  def index
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  def purchase_shipping_index
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end
