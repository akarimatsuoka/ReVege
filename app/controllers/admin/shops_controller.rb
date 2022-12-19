class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @shop=Shop.new
  end

  def create
    @shop=Shop.new(shop_params)
    if @shop.save
      flash[:notice] = "ショップの新規登録が完了しました！"
      redirect_to admin_shops_path(@shop.id)
    else
      render :new
    end
  end

  def index
     @shops=Shop.page(params[:page])
  end

  def edit
    @shop=Shop.find(params[:id])
  end

  def update
    @shop=Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:notice] = "ショップの編集内容を保存しました！"
      redirect_to admin_shops_path
    else
      render "edit"
    end
  end

  def destroy
    @shop=Shop.find(params[:id])
    @shop.destroy
    redirect_to admin_shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:image, :name, :introduction, :postal_code, :prefecture, :address, :phone_number)
  end

end
