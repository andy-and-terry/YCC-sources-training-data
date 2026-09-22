class Coffee
  def cost
    2.0
  end

  def description
    "coffee"
  end
end

class CoffeeDecorator < SimpleDelegator
  def initialize(coffee)
    super
  end
end

class MilkDecorator < CoffeeDecorator
  def cost
    __getobj__.cost + 0.5
  end

  def description
    "#{__getobj__.description}, milk"
  end
end

class SugarDecorator < CoffeeDecorator
  def cost
    __getobj__.cost + 0.25
  end

  def description
    "#{__getobj__.description}, sugar"
  end
end

require "delegate"

order = SugarDecorator.new(MilkDecorator.new(Coffee.new))
puts "#{order.description}: $#{'%.2f' % order.cost}"
