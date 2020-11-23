class Product < ApplicationRecord
  has_many :assigment_product_categories
  has_many :categories, through: :assigment_product_categories
  has_many :ratings
  has_many :line_items
end
