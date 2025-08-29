class Product < ApplicationRecord
  belongs_to :store
  has_many :items, dependent: :destroy

  validates :sku, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
  validates :available_units, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }

  def has_stock?(quantity)
    available_units >= quantity
  end

  def decrement_stock(quantity)
    self.available_units -= quantity
  end

  def retrieve_price_rule
    @rules_manager ||= RulesHandler.new
    @rules_manager.get_rule(sku)
  end
end
