class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
  end

  def complete
  end

  def index
   @orders = current_customer.orders
  end

  def show
    #@order = Order.find(params[:id])
   # @order_items = @order.order_items
  end
end
