class Admins::OrderDetailsController < ApplicationController
  def update
    @order_detail = Order_detail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admins_order_path(@order)
  end
  private
  def order_detail
    params.require(:order_detail).permit(:price, :amount, :making_status)
  end
end
