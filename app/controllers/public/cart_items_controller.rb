class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.inject(0){ |sum, item| sum + item.subtotal}
  end

  def create
     @item = Item.find(cart_items_params[:item_id])

     #同じ商品がカートに入っていた場合
      if current_customer.cart_items.find_by(item_id: @item)
        @cart_item = CartItem.find_by(item_id: @item)
        @cart_item.quantity += params[:cart_item][:quantity].to_i

     #カートに同じ商品がなかった場合
      else
        @cart_item = CartItem.new(cart_items_params)
      end

      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to cart_items_path
  end


  def update
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_items_params
      params.require(:cart_item).permit(:item_id, :quantity)
  end

end
