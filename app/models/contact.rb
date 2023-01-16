class Contact < ApplicationRecord
  belongs_to :customer

  validates :subject, presence: true
  validates :content, presence: true

end