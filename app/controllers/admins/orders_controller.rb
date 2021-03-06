class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @customer = @order.customer
    @order_details = OrderDetail.all
    @oder_detail = OrderDetail.find(params[:id])
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
