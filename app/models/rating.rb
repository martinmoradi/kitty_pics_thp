class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :order
end
