class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end
  def confirm
    @order = Order.new(order_params)
    @orders = current_customer.orders
    if params[:order][:select_address] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
    @address = current_customer.addresses.find(params[:order][:address])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    else
    @order.postal_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:end]
    end
  end
  def complete

  end
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    if @order.save
     @cart_items.each do |cart_item|
     @order_detail = OrderDetail.new(item_id: cart_item.item_id, amount: cart_item.amount, price: cart_item.item.price, making_status: 0, order_id: @order.id)
     @order_detail.save
     end
     current_customer.cart_items.destroy_all
     render complete_path
    end
  end
  def index
    @orders = current_customer.orders
  end
  def show
    @ordes = current_customer.orders
    @order_detail = OrderDetail.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:total_payment, :shipping_cost, :payment_method, :status, :postal_code, :address, :name)
  end

end
