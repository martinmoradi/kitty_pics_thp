class Category < ApplicationRecord
  has_many :assigment_product_categories
  has_many :products, through: :assigment_product_categories
end
