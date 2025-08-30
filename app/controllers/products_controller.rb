class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = current_store.products.all
    @current_user = current_user
  end

  def show
    @current_user = current_user
  end

  def new
    @product = current_store.products.build
  end

  def create
    @product = current_store.products.build(product_params)

    if @product.save
      redirect_to @product, notice: 'Producto creado exitosamente.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Producto actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Producto eliminado exitosamente.'
  end

  def add_to_cart
    product = current_store.products.find(params[:id])
    quantity = params[:quantity].to_i

    if current_store.add_product_to_cart(current_user, product, quantity)
      redirect_to products_path, notice: "#{product.name} agregado al carrito (#{quantity} unidades)"
    else
      redirect_to products_path, alert: 'No hay suficientes unidades disponibles'
    end
  end

  private

  def set_product
    @product = current_store.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:sku, :name, :description, :available_units, :unit_price)
  end
end
