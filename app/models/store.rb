class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :total_sales, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def add_product_to_cart(user, product, quantity)
    return false unless product.has_stock?(quantity)

    user.add_item_to_cart(product, quantity)
  end

  def remove_item_from_cart(user, item)
    user.delete_item_from_cart(item)
  end

  def finalize_purchase(user)
    shopping_cart = user.shopping_cart
    total_purchase = shopping_cart.calculate_total

    ActiveRecord::Base.transaction do
      shopping_cart.items.each do |item|
        product = item.product
        product.decrement_stock(item.quantity)
        product.save!
      end

      self.total_sales += total_purchase
      self.save!

      shopping_cart.items.destroy_all
    end

    total_purchase
  end
end
