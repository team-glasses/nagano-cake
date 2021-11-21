class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_items
  belongs_to :category

  attachment :image

  def add_tax_price
    (price * 1.10).round
  end

end
