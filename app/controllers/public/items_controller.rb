class Public::ItemsController < ApplicationController

  def index
    if params[:genre_id].present? #ジャンル検索のみ実行されてる場合
      @genre = Genre.find(params[:genre_id])
    elsif params[:q] && params[:q][:genre_id].present? #検索ボタンが押されてて、かつジャンルがある場合
      @genre = Genre.find(params[:q][:genre_id])
    end

    if @genre.nil?
      # 検索オブジェクトItemのキーワード検索
      @search = Item.ransack(params[:q])
    else
      @search = @genre.items.ransack(params[:q])
    end
    # 検索結果
    @items = @search.result.where(status: true).page(params[:page]) #@searchで出力したitem（statusがtrueのもののみ）が一覧で出る
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new

    if params[:genre_id].present? #ジャンル検索のみ実行されてる場合
      @genre = Genre.find(params[:genre_id])
    elsif params[:q] && params[:q][:genre_id].present? #検索ボタンが押されてて、かつジャンルがある場合
      @genre = Genre.find(params[:q][:genre_id])
    end

    if @genre.nil?
      # 検索オブジェクトItemのキーワード検索
      @search = Item.ransack(params[:q])
    else
      @search = @genre.items.ransack(params[:q])
    end
    # 検索結果
    @items = @search.result.where(status: true) #@searchで出力したitem（statusがtrueのもののみ）が一覧で出る
    @genres = Genre.all
  end

end
