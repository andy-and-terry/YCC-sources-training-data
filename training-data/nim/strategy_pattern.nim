type
  DiscountStrategy = proc (price: float): float

proc noDiscount(price: float): float = price
proc tenPercentOff(price: float): float = price * 0.9
proc halfOff(price: float): float = price * 0.5

proc checkout(price: float, strategy: DiscountStrategy): float =
  strategy(price)

let strategies: seq[DiscountStrategy] = @[noDiscount, tenPercentOff, halfOff]
for strategy in strategies:
  echo checkout(100.0, strategy)
