class RulesHandler
  def get_rule(sku)
    case sku[0..1]
    when 'EA'
      NormalPriceRule.new
    when 'WE'
      WeightPriceRule.new
    when 'SP'
      SpecialPriceRule.new
    else
      NormalPriceRule.new
    end
  end
end
