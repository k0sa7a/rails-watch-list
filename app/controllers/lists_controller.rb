class ListsController < ApplicationController
  def main
    @lists = List.all
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.save

      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def params_list
    params.require(:list).permit(:name, :photo)
  end
end
