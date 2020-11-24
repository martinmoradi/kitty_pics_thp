class StaticController < ApplicationController
  def index
    @products = Product.all
  end
end
