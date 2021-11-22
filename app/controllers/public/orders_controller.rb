class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
    @order = Order.new(order_params)
  end

  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method)
  end

end
