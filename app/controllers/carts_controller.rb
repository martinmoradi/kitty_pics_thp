class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = Cart.all
  end

  def new
    @cart = Cart.new
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to carts_path, notice: "Cart was successfully destroyed." }
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def carts_params
    params.fetch(:cart, {})
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_path, notice: "This cart does not exist"
  end
end
