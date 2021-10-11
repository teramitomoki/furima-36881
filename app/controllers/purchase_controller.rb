class PurchaseController < ApplicationController
  
  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
  end

end
