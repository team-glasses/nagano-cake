class OrderItem < ApplicationRecord
  attribute :making_status, :integer, default: 0

  belongs_to :order
  belongs_to :item

  enum making_status: { not_startable: 0, waiting_for_production: 1, production: 2, production_completed: 3 }

end