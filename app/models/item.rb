class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre, optional: true
  belongs_to :shop
  has_many :cart_items

  validates :image, presence: true
  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :shop_id, presence: true

  def with_tax_price
    (price*1.1).floor
  end

end
