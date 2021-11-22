class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum selected_address: { current_customer_address: 0, addresses_of_current_customer: 1, new_address: 2 }
  
  def postage_for_order
    postage = 800
  end  

end
