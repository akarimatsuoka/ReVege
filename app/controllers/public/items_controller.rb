class Public::ItemsController < ApplicationController
  def index
    # 検索オブジェクトItemのキーワード検索
    @search = Item.ransack(params[:q])
    # 検索結果
    @items = @search.result.where(status: true) #@searchで出力したitem（statusがtrueのもののみ）が一覧で出る
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
