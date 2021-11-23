class Order < ApplicationRecord
  attribute :status, :integer, default: 0

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum status: { waiting_for_deposit: 0, payment_confirmation: 1, in_production: 2, preparing_for_shipping: 3, sent: 4 }, _prefix:true

  def total_billing_amount
    total_payment + postage
  end

end