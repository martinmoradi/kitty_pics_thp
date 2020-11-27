class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  has_many :line_items, dependent: :destroy
  after_create :send_order_mail
  after_create :send_admin_mail

  def send_order_mail
    OrderMailer.shopping_mail(self).deliver_now
  end

  def send_admin_mail
    AdminMailer.shopping_mail_admin(self).deliver_now
  end
end
