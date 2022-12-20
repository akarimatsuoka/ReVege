class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  validates :quantity, numericality: { greater_than_or_equal_to: 1 } #numericality（自然数）。１もしくは１以上じゃないとダメ

  def subtotal
    item.with_tax_price * quantity #税込み価格×数量
  end
end
