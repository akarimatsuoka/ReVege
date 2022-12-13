class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :shop

  validates :customer_id, uniqueness: { scope: :shop_id } #customer_idとshop_idは同じ組み合わせは1つだけにしてください
end
