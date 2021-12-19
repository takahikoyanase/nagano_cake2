class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_payment
  end
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item)
    redirect_to cart_items_path(@cart_items)
  end
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  def destroy_all
  end
  def create
    binding.pry
    @item = Item.find(cart_item_params[:item_id])
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
