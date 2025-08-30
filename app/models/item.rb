class Item < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def calculate_total
    price_rule = product.retrieve_price_rule
    price_rule.calculate_total(quantity, product.unit_price)
  end
end
