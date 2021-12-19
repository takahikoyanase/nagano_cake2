class Admins::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).reverse_order
  end
end
