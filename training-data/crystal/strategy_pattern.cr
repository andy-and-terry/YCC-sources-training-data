abstract class DiscountStrategy
  abstract def apply(total : Float64) : Float64
end

class NoDiscount < DiscountStrategy
  def apply(total : Float64) : Float64
    total
  end
end

class PercentageDiscount < DiscountStrategy
  def initialize(@percent : Float64)
  end

  def apply(total : Float64) : Float64
    total - (total * @percent / 100.0)
  end
end

class FlatDiscount < DiscountStrategy
  def initialize(@amount : Float64)
  end

  def apply(total : Float64) : Float64
    [total - @amount, 0.0].max
  end
end

class Cart
  def initialize(@strategy : DiscountStrategy)
  end

  def checkout(total : Float64) : Float64
    @strategy.apply(total)
  end
end

puts Cart.new(NoDiscount.new).checkout(100.0)
puts Cart.new(PercentageDiscount.new(20.0)).checkout(100.0)
puts Cart.new(FlatDiscount.new(15.0)).checkout(100.0)
