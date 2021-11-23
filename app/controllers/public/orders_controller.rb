class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.all
    @total_price = @cart_items.inject(0){ |sum, item| sum + item.subtotal }
    @total_payment = @total_price+800
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)

    if @order.save
      cart_items.each do |cart_item|
        order_item = OrderItem.new
        order_item.item_id = cart_item.item_id
        order_item.order_id = @order.id
        order_item.quantity = cart_item.quantity
        order_item.price = cart_item.item.add_tax_price
        order_item.save
      end
      cart_items.destroy_all
      redirect_to orders_complete_path
    end
  end

  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :postage)
  end



end
