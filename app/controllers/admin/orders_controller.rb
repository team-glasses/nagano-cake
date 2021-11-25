class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    if params[:order][:status]) == 1
      @order.update(status: params[:order][:status])
      redirect_back(fallback_location: admin_root_path)
    else
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :total_payment, :postage, :payment_method, :status, :created_at)
  end

end