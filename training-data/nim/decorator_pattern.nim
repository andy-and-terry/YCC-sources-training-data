type
  Beverage = ref object of RootObj

method cost(b: Beverage): float {.base.} =
  discard

method description(b: Beverage): string {.base.} =
  discard

type
  Espresso = ref object of Beverage

method cost(b: Espresso): float =
  1.50

method description(b: Espresso): string =
  "Espresso"

type
  BeverageDecorator = ref object of Beverage
    wrapped: Beverage

  WithMilk = ref object of BeverageDecorator
  WithCaramel = ref object of BeverageDecorator

method cost(b: WithMilk): float =
  cost(b.wrapped) + 0.40

method description(b: WithMilk): string =
  description(b.wrapped) & " + milk"

method cost(b: WithCaramel): float =
  cost(b.wrapped) + 0.60

method description(b: WithCaramel): string =
  description(b.wrapped) & " + caramel"

var drink: Beverage = Espresso()
drink = WithMilk(wrapped: drink)
drink = WithCaramel(wrapped: drink)
echo description(drink), " costs ", cost(drink)
