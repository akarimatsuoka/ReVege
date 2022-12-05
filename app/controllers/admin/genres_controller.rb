class Admin::GenresController < ApplicationController

  def index
    @genre=Genre.new
    @genres=Genre.all
  end

  def create
    @genre=Genre.new(genre_params)
    @genre.save
    redirect_to genres_path
  end

  def edit
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
