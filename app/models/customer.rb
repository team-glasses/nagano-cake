class Customer < ApplicationRecord
  attribute :is_deleted, :boolean, default: 'false'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders

  def full_address
    '〒' + postal_code + ' ' + address
  end


end
