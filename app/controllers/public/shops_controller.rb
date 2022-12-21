class Public::ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
  end

  def item
    @item = Shop.find(params[:id]).items
  end
  
  
end
