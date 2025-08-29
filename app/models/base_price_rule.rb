# Interface

class BasePriceRule
  def applicable?(sku)
    raise NotImplementedError, "Must create applicable? method"
  end

  def calculate_total(quantity, price)
    raise NotImplementedError, "Must create calculate_total method"
  end
end
