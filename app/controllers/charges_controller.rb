class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @cart = @current_cart
    @amount = (@cart.sub_total * 100).to_i

    customer = Stripe::Customer.create({
                                         email: params[:stripeEmail],
                                         source: params[:stripeToken]
                                       })

    charge = Stripe::Charge.create({
                                     customer: customer.id,
                                     amount: @amount,
                                     description: "Charge #{current_user.firstname}",
                                     currency: 'eur'
                                   })                             
    Order.create(user_id: current_user.id, cart_id: @cart.id, address_id: 1)  
    session[:cart_id] = nil                        
    flash[:notice] = "Thanks! You paid $#{(@amount / 100).round(2)}."
    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
