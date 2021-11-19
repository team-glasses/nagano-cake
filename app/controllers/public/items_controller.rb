class Public::ItemsController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.page(params[:page]).reverse_order
  end

  def show
    @categories = Category.all
    @item = Item.find(params[:id])
  end
end
