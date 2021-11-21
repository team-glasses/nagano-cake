class Public::HomesController < ApplicationController
  def top
    @categories = Category.all
    @item = Item.limit(4).order("created_at DESC").where(is_active: 'true')
  end

  def about
  end
end
