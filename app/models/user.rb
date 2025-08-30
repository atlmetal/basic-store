class User < ApplicationRecord
  belongs_to :store
  has_one :shopping_cart, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  after_create :create_shopping_cart

  def add_item_to_cart(product, quantity)
    existing_item = shopping_cart.items.find_by(product: product)

    if existing_item
      existing_item.quantity += quantity
      existing_item.save
    else
      shopping_cart.items.create(product: product, quantity: quantity)
    end
  end

  def delete_item_from_cart(item)
    item.destroy if item.shopping_cart == self.shopping_cart
  end

  private

  def create_shopping_cart
    create_shopping_cart
  end
end
