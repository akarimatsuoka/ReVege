class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_for_payment: 0, payment_confirmation: 1, shipping_preparation: 2, sent: 3 }
end
