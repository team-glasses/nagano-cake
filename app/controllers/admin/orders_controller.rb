class Admin::OrdersController < ApplicationController
  def show
    @order = Order.all
  end
end
