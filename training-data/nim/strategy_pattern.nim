type
  DiscountStrategy = ref object of RootObj

method applyDiscount(s: DiscountStrategy, price: float): float {.base.} =
  discard

type
  NoDiscount = ref object of DiscountStrategy
  PercentOffDiscount = ref object of DiscountStrategy
    percent: float
  FlatOffDiscount = ref object of DiscountStrategy
    amount: float

method applyDiscount(s: NoDiscount, price: float): float =
  price

method applyDiscount(s: PercentOffDiscount, price: float): float =
  price - price * (s.percent / 100.0)

method applyDiscount(s: FlatOffDiscount, price: float): float =
  max(0.0, price - s.amount)

type
  Cart = ref object
    strategy: DiscountStrategy

proc newCart(strategy: DiscountStrategy): Cart =
  Cart(strategy: strategy)

proc checkout(c: Cart, price: float): float =
  c.strategy.applyDiscount(price)

let regularCart = newCart(NoDiscount())
let saleCart = newCart(PercentOffDiscount(percent: 20.0))
let couponCart = newCart(FlatOffDiscount(amount: 5.0))

echo checkout(regularCart, 100.0)
echo checkout(saleCart, 100.0)
echo checkout(couponCart, 100.0)
