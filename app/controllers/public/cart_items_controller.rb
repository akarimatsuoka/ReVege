class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!, only:[:create]
  before_action :setup_cart_item!, only:[:create]

  def index
    @cart_items = current_customer.cart_items.all
    @total = 0
    @postage = 600
  end

  def create
    @cart_item ||= current_customer.cart_items.new(item_id: params[:cart_item][:item_id]) #「||」は中身が空かどうか確認してる。空じゃなかったら15行目に飛ぶ。
    #11行目は13,14行目の内容にitem_idの情報が入った１文になってる
      # @cart_item ||= CartItem.new
      # @cart_item.customer_id = current_customer.id
    @cart_item.quantity += params[:cart_item][:quantity].to_i
      if @cart_item.save
        redirect_to cart_items_path
      else
        redirect_to item_path(params[:cart_item][:item_id]) #ここparamsいるの？なにこれ
      end
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :customer_id)
  end

  def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
  end

end
