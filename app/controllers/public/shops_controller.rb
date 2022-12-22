class Public::ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
  end

  def items
    shop = Shop.pluck(:item_id) #Shopモデルの中でカスタマーidを見つけてきて、カスタマーidに紐づいてるshop_idを取得
    @shop_items = Item.find(shop)
  end


end
