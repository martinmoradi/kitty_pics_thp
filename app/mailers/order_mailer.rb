class OrderMailer < ApplicationMailer

  def shopping_mail(order)
    @order = order 
    mail(to: @order.user.email, subject: "Récap de commande")
  end

end
