local PizzaBuilder = {}
PizzaBuilder.__index = PizzaBuilder

function PizzaBuilder.new()
  return setmetatable({ toppings = {}, size = "medium" }, PizzaBuilder)
end

function PizzaBuilder:with_size(size)
  self.size = size
  return self
end

function PizzaBuilder:add_topping(topping)
  table.insert(self.toppings, topping)
  return self
end

function PizzaBuilder:build()
  return string.format("%s pizza with: %s", self.size, table.concat(self.toppings, ", "))
end

local pizza = PizzaBuilder.new()
  :with_size("large")
  :add_topping("cheese")
  :add_topping("mushrooms")
  :build()

print(pizza)
