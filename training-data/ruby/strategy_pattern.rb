class PriceCalculator
  def initialize(strategy)
    @strategy = strategy
  end

  def total(amount)
    @strategy.call(amount)
  end
end

regular_pricing = ->(amount) { amount }
member_discount = ->(amount) { amount * 0.9 }
clearance_discount = ->(amount) { amount * 0.5 }

[regular_pricing, member_discount, clearance_discount].each do |strategy|
  calculator = PriceCalculator.new(strategy)
  puts calculator.total(100).round(2)
end
