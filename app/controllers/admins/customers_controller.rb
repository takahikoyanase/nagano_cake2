class Admins::CustomersController < ApplicationController
 def index
  @customers = Customer.all.page(params[:page]).reverse_order
 end
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
  redirect_to admins_customers_path
 end

 private
 def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
 end
end
