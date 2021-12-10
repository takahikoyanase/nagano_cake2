class Admins::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admins_genres
  end
  def edit
    @genre = Genre.find(params[:id])
    render :edit
  end
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
     redirect_to admin_genres
    else
     render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
