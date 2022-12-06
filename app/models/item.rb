class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre, optional: true
  belongs_to :shop, dependent: :destroy
end
