class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Items.new(item_params)
    @item.save
    redirect_to items_url

  end
  def show
  end
  def edit
  end
  def update
  end

  private item_params
   params.require(:item).permit(:name, :image_id, :introduction, :price, :is_active)
end
