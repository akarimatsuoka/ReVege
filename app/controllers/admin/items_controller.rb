class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      flash[:notice] = "商品の新規登録が完了しました！"
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def index
    @items=Item.page(params[:page])
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品の編集内容を保存しました！"
      redirect_to admin_item_path(@item.id)
    else
      render "edit"
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :genre_id, :shop_id, :price, :status)
  end

end
