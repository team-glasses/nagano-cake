class Order < ApplicationRecord
  attribute :status, :integer, default: '0'

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum status: { waiting_for_deposit: 0, payment_confirmation: 1, in_production: 2, preparing_for_shipping: 3, sent: 4 }, _prefix:true

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum selected_address: { current_customer_address: 0, addresses_of_current_customer: 1, new_address: 2 }

  def postage_for_order
    postage = 800
  end

end