class Item < ApplicationRecord
  has_one_attached :photo
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :order_items
  validates :title, presence: true
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, inclusion: { in: 1..1000}

end
