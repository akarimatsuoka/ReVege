class Public::BookmarksController < ApplicationController
  
  def create
    @shop = Shop.find(params[:shop_id]) #Shopモデルからshop_idを探してくる。
    current_customer.bookmark(@shop) #ログイン中のユーザーと紐づけられたidを取ってくる。この時、customer.rbに定義したaliasを使用し、idの情報を保存する。
  end

  def destroy
    @shop = current_customer.bookmarks.find(params[:shop_id]).shop
    current_user.unbookmark(@shop)
    # redirect_backはユーザーが直前にリクエストを送ったページに戻す
    # fallback_location: デフォルトの設定
  end
end
