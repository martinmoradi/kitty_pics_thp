class AdminMailer < ApplicationMailer
  def shopping_mail_admin(order)
    @order = order
    mail(to: User.admin?.pluck(:email), subject: 'Une commande a été passée !')
  end
end
