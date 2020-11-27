class Admin::DashboardController < ApplicationController

    def index
      @admin_product = Product.all
      @admin_users = User.all
      @admin_orders = Order.all
    end
  
end
