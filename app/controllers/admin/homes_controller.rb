class Admin::HomesController < ApplicationController
  def top
    path = Rails.application.routes.recognize_path(request.referer)
    @total_quantity = OrderItem.group(:order_id).sum(:quantity)
    if path[:controller] == "amdin/customers" && path[:action] == "show"
      @orders = Order.where(customer_id: path[:id])
    else
      @orders = Order.all
    end
      @orders = Order.page(params[:page]).per(10)
  end


end


