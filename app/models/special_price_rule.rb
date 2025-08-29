class SpecialPriceRule < BasePriceRule
  def applicable?(sku)
    sku.start_with?('SP')
  end

  def calculate_total(quantity, price)
    base_price = quantity * price
    discount = calculate_discount(quantity)
    base_price * (1 - discount)
  end

  private

  def calculate_discount(quantity)
    groups_of_three = quantity / 3
    discount = groups_of_three * 0.20
    [discount, 0.50].min
  end
end
