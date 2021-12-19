class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    
  end
  def comfirm

  end
  def complete

  end
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
       flash[:success] = '投稿しました'
       redirect_to orders_path
    else
       render :new
    end
  end
  def index
    @orders = Order.all
  end
  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:total_payment, :shipping_cost, :payment_method, :status, :postal_code, :address, :name)
  end

end
