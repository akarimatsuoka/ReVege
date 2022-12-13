class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.order(created_at: "DESC")
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
end
