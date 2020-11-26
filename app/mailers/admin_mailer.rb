class AdminMailer < ApplicationMailer
  def shopping_mail_admin(order)
    @order = order
    mail(to: @admin.email, subject: 'Récap de commande')
  end
end
