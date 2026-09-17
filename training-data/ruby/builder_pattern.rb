class Pizza
  attr_reader :size, :toppings

  def initialize(size, toppings)
    @size = size
    @toppings = toppings
  end

  def to_s
    "#{size} pizza with #{toppings.join(', ')}"
  end
end

class PizzaBuilder
  def initialize
    @size = "medium"
    @toppings = []
  end

  def size(value)
    @size = value
    self
  end

  def add_topping(topping)
    @toppings << topping
    self
  end

  def build
    Pizza.new(@size, @toppings)
  end
end

pizza = PizzaBuilder.new
                     .size("large")
                     .add_topping("cheese")
                     .add_topping("olives")
                     .build

puts pizza
