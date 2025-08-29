class WeightPriceRule < BasePriceRule
  def applicable?(sku)
    sku.start_with?('WE')
  end

  def calculate_total(quantity, price)
    price_per_kg = price * 1000
    (quantity / 1000.0) * price_per_kg
  end
end
