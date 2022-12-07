class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(status: true).all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
