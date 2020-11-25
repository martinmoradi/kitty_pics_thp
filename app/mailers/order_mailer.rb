class OrderMailer < ApplicationMailer

  def shopping_mail(order)
    @order = order 
    mail(to: @order.user.email, subject: "Voici ta commande")
  end

end
