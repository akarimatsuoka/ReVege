class Public::BookmarksController < ApplicationController
  before_action :authenticate_customer!

  def create
    @shop = Shop.find(params[:shop_id]) #Shopモデルからshop_idを探してくる。
    current_customer.bookmarks.create(shop_id: @shop.id) #ログインしてるユーザーが持ってるブックマークをcreateする
  end

  def destroy
    bookmark = current_customer.bookmarks.find_by(shop_id: params[:shop_id]) #ログインしてるユーザーが持ってるブックマークの中から1つ探してくる
    @shop = bookmark.shop
    bookmark.destroy
  end
end
