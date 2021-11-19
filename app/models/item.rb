class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_items
  belongs_to :category

  #税込価格への計算
  def add_tax_price
    (self.price * 1.10).round
  end

end
