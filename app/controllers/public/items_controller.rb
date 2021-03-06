class Public::ItemsController < ApplicationController
  def index
    @categories = Category.all
    @item = Item.where(is_active: 'true')
    @items = Item.page(params[:page]).per(8).where(is_active: 'true')
  end

  def show
    @categories = Category.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def item_params
    params.require(:item).permit(:category_id, :name, :explanation, :price, :image, :is_active)
  end

end
