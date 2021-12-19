class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @customer = Customer.find(params[:id])
    @item = Item.find(params[:id])
  end
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:payment_status, :status)
  end
end
