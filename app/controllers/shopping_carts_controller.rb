class ShoppingCartsController < ApplicationController
  def show
    @shopping_cart = current_user.shopping_cart
    @products = current_store.products.where('available_units > 0')
  end

  def add_item
    product = current_store.products.find(params[:product_id])
    quantity = params[:quantity].to_i

    if current_store.add_product_to_cart(current_user, product, quantity)
      redirect_to shopping_cart_path, notice: 'Product added to cart.'
    else
      redirect_to shopping_cart_path, alert: 'Not enough units available.'
    end
  end

  def remove_item
    item = current_user.shopping_cart.items.find(params[:item_id])
    current_store.remove_item_from_cart(current_user, item)
    redirect_to shopping_cart_path, notice: 'Item removed from cart.'
  end

  def checkout
    begin
      total = current_store.finalize_purchase(current_user)
      redirect_to shopping_cart_path, notice: "Checkout completed. Total: $#{total}"
    rescue => e
      redirect_to shopping_cart_path, alert: "Error during checkout: #{e.message}"
    end
  end
end