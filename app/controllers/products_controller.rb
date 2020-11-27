class ProductsController < ApplicationController
  
def index
  @categories = Category.all
  if params[:category_id]
    @category = Category.includes(:products)
                        .find(params[:category_id])
    @products = @category.products
  else
    @products = Product.all
  end
end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :img_url, :description)
  end
end
