class Admin::ShopsController < ApplicationController
  def new
    @shop=Shop.new
  end

  def create
    @shop=Shop.new(shop_params)
    if @shop.save
      redirect_to admin_shop_path(@shop.id)
    else
      render :new
    end
  end

   def index
     @shops=Shop.all
   end

  def edit
  end

  private

  def shop_params
    params.require(:shop).permit(:image, :name, :introduction, :postal_code, :prefecture, :address, :phone_number)
  end

end
