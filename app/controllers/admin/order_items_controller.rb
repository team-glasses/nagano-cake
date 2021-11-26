class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(making_status: params[:order_item][:making_status])
      if @order_item.making_status == "production"
        @order = @order_item.order
        @order.status = "in_production"
        @order.save
      elsif @order_item.making_status == "production_completed"
        @order = @order_item.order
        @order_items = @order.order_items
        count = 0
        @order_items.each do |order_item|
          if order_item.making_status == "production_completed"
            count += 1
          end
        end
        if count == @order_items.count
          @order.status = "preparing_for_shipping"
          @order.save
        end
      end
      redirect_back(fallback_location: admin_root_path)
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end


