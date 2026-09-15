class Coffee
  def cost
    2.0
  end

  def description
    'Coffee'
  end
end

class CoffeeDecorator
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost
  end

  def description
    @coffee.description
  end
end

class MilkDecorator < CoffeeDecorator
  def cost
    super + 0.5
  end

  def description
    "#{super}, Milk"
  end
end

class SyrupDecorator < CoffeeDecorator
  def cost
    super + 0.75
  end

  def description
    "#{super}, Syrup"
  end
end

drink = SyrupDecorator.new(MilkDecorator.new(Coffee.new))
puts drink.description   # Coffee, Milk, Syrup
puts drink.cost           # 3.25
