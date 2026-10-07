abstract class Coffee
  abstract def cost : Float64
  abstract def description : String
end

class SimpleCoffee < Coffee
  def cost : Float64
    2.0
  end

  def description : String
    "coffee"
  end
end

abstract class CoffeeDecorator < Coffee
  def initialize(@coffee : Coffee)
  end
end

class MilkDecorator < CoffeeDecorator
  def cost : Float64
    @coffee.cost + 0.5
  end

  def description : String
    "#{@coffee.description} + milk"
  end
end

class SugarDecorator < CoffeeDecorator
  def cost : Float64
    @coffee.cost + 0.25
  end

  def description : String
    "#{@coffee.description} + sugar"
  end
end

order = SugarDecorator.new(MilkDecorator.new(SimpleCoffee.new))
puts "#{order.description}: $#{order.cost}"
