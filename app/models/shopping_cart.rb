class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  def add_item(product, quantity)
    items.create(product: product, quantity: quantity)
  end

  def calculate_total
    items.sum(&:calculate_total)
  end

  def remove_item(item)
    item.destroy
  end
end
