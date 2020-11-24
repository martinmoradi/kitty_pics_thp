class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
   
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: "Item added to cart." }
        format.js { }
      else
        format.html { render :new }
        format.js { }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @cart = Cart.find(session[:cart_id])
    @line_item.destroy
    redirect_to cart_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_items
    @line_item = LineItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def line_items_params
    params.require(:line_item).permit(:product_id)
  end
end
