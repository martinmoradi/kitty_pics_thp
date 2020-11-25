class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  belongs_to :address
  has_many :line_items, dependent: :destroy

 after_create :send_order_mail

 def send_order_mail
  OrderMailer.shopping_mail(self).deliver_now
 end

end
