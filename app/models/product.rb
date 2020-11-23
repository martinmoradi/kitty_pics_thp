class Product < ApplicationRecord
  has_many :assigment_product_categories
  has_many :categories, through: :assigment_product_categories
  has_many :ratings
  has_many :line_items

  validates :title,
    presence: true,
    length: { in: 3..50 }
  validates :description,
    presence: true,
    length: { in: 16..1024 }
  validates :price,
    presence: true,
    numericality: { greater_than: 0 }

  has_one_attached :picture
end
