class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = current_customer.shipping_addresses
  end

  def confirm
    @order=Order.new(order_params)
    @postage = 800
    @customer = current_customer
    @addresses = current_customer.shipping_addresses

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:select_address] == "1"
      @address=ShippingAddress.find(params[:order][:address_id])
      @order.post_code=@address.post_code
      @order.address=@address.address
      @order.name=@address.name

      #if ShippingAddress.exists?
        #@order.address = ShippingAddress.find(params[:order][:address_id]).address
       # @order.name = ShippingAddress.find(params[:order][:address_id]).name
       # @order.postal_code = ShippingAddress.find(params[:order][:address_id]).postal_code
      #end
    else params[:order][:select_address]=='2'
      @order.customer_id=current_customer.id
    end
  end

  def index
  end

  def show
  end

  def complete
  end

  def confirm
  end
end
