class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(making_status: params[:order_item][:making_status])
    redirect_back(fallback_location: admin_root_path)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end


