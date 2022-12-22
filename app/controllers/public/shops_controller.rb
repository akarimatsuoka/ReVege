class Public::ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
  end

  def items
    @shop = Shop.find(params[:id])
    @shop_items = @shop.items.page(params[:page])
  end

end