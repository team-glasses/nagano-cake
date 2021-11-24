class Admin::OrdersController < ApplicationController
  def show
    @order = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    #仮でadminのトップ画面へ遷移させています。
    redirect_to admin_root_path
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

end
