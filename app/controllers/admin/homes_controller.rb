class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
  end
  
  
  def total_quantity
    quantity = find_by(:quontity )
  end
end
