type
  Coffee = ref object of RootObj

  SimpleCoffee = ref object of Coffee

  CoffeeDecorator = ref object of Coffee
    wrapped: Coffee

  MilkDecorator = ref object of CoffeeDecorator
  SugarDecorator = ref object of CoffeeDecorator

method cost(c: Coffee): float {.base.} =
  discard

method describe(c: Coffee): string {.base.} =
  discard

method cost(c: SimpleCoffee): float =
  2.0

method describe(c: SimpleCoffee): string =
  "coffee"

method cost(c: MilkDecorator): float =
  cost(c.wrapped) + 0.5

method describe(c: MilkDecorator): string =
  describe(c.wrapped) & " + milk"

method cost(c: SugarDecorator): float =
  cost(c.wrapped) + 0.25

method describe(c: SugarDecorator): string =
  describe(c.wrapped) & " + sugar"

var order: Coffee = SimpleCoffee()
order = MilkDecorator(wrapped: order)
order = SugarDecorator(wrapped: order)

echo describe(order), " = ", cost(order)
