class Admin::HomesController < ApplicationController
  def top
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "amdin/customers" && path[:action] == "show"
      @orders = Order.where(cutomer_id: path[:id])
    else
      @orders = Order.all
    end
  end


  def total_quantity(order_id)
    total_quantity = OrderItem.grop(:order_id).sum(:quontity)
    total_quantity.order_id
  end
end
