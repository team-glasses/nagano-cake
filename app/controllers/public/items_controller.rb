class Public::ItemsController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.page(params[:page])
  end

  def show
    @categories = Category.all
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:category_id, :name, :explanation, :price, :image, :is_active)
  end

end
