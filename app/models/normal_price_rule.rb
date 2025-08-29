class NormalPriceRule < BasePriceRule
  def applicable?(sku)
    sku.start_with?('EA')
  end

  def calculate_total(quantity, price)
    quantity * price
  end
end
