class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre=Genre.new
    @genres=Genre.page(params[:page])
  end

  def create
    @genre=Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルの新規登録が完了しました！"
      redirect_to admin_genres_path
    else
      @genres=Genre.all
      render "index"
    end
  end

  def edit
    @genre=Genre.find(params[:id])
  end

  def update
    @genre=Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "変更内容を保存しました！"
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end

  def destroy
    @genre=Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
