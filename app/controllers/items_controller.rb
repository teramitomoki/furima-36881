class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to edit_user_path(@item.user_id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :condition_id, :shipping_charge_id,:prefecture_id, :estimated_shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
