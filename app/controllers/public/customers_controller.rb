class Public::CustomersController < ApplicationController
  def show
   @customer = Customer.find(params[:id])
  end
  def edit
   @customer = Customer.find(params[:id])
   render :edit
  end
  def update
   @customer = Customer.find(params[:id])
   @customer.update(customer_params)
   redirect_to customer_path
  end
  def unsubscribe
   @customer = Customer.find(params[:id])
  end

  def withdrawal
   @customer = Customer.find(params[:id])
   @customer.update(is_active: true)
   reset_session
   flash[:notice] = "退会処理を実行しました"
   redirect_to root_path
  end

  private
  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end
end