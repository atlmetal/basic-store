class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = current_store.products.all
  end

  def show; end

  def new
    @product = current_store.products.build
  end

  def create
    @product = current_store.products.build(product_params)

    if @product.save
      redirect_to @product, notice: 'Product created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product deleted successfully.'
  end

  private

  def set_product
    @product = current_store.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:sku, :name, :description, :available_units, :unit_price)
  end
end
