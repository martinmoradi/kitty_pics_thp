class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  belongs_to :address
  has_many :ratings
end
