class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :order

  def total_price
    quantity * product.price
  end
end
