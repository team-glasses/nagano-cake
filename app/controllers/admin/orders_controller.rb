class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end


  def update
    @order = Order.find(params[:id])
    if @order.update(status: params[:order][:status])
      if @order.status == "payment_confirmation"
        @order_items = @order.order_items
        @order.order_items.each do |order_item|
          order_item.making_status = "waiting_for_production"
          order_item.save
        end
      end
      redirect_back(fallback_location: admin_root_path)
    end
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :total_payment, :postage, :payment_method, :status, :created_at)
  end

end