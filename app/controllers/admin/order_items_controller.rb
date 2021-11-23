class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = Order_item.find(params[:id])
    @order_item.update(order_item_params)
    #仮でadminのトップ画面へ遷移させています。
    redirect_to admin_root_path
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end
