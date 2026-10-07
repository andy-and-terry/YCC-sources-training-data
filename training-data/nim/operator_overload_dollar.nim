type Money = object
  cents: int

proc `$`(m: Money): string =
  $(m.cents div 100) & "." & (if m.cents mod 100 < 10: "0" else: "") & $(m.cents mod 100)

proc `+`(a, b: Money): Money = Money(cents: a.cents + b.cents)
proc `<`(a, b: Money): bool = a.cents < b.cents

let a = Money(cents: 1050)
let b = Money(cents: 295)
echo a + b
echo a < b
echo b < a
