class Admins::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).reverse_order
  end
  def new
    @item = Item.new
    @genres = Genre.all
  end
  def create
    @item = Items.new(item_params)
    if @item.save
      flash[:success] = '投稿しました'
      redirect_to items_url
    else
      render :new
    end
  end
  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
    render :edit
  end
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admins_items_path

  end

  private
  def item_params
   params.require(:item).permit(:name, :image_id, :introduction, :price, :is_active, :genre_id)
  end
end
