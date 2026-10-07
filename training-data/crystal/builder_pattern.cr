class Pizza
  getter size : String
  getter toppings : Array(String)

  def initialize(@size : String, @toppings : Array(String))
  end

  def to_s(io)
    io << "#{size} pizza with #{toppings.join(", ")}"
  end
end

class PizzaBuilder
  def initialize
    @size = "medium"
    @toppings = [] of String
  end

  def size(size : String) : PizzaBuilder
    @size = size
    self
  end

  def add_topping(topping : String) : PizzaBuilder
    @toppings << topping
    self
  end

  def build : Pizza
    Pizza.new(@size, @toppings)
  end
end

pizza = PizzaBuilder.new
  .size("large")
  .add_topping("cheese")
  .add_topping("mushroom")
  .build

puts pizza
