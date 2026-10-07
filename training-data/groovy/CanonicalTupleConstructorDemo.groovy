import groovy.transform.Canonical
import groovy.transform.TupleConstructor

@Canonical
class Money {
    BigDecimal amount
    String currency
}

@TupleConstructor
class Interval {
    int low
    int high
}

def price = new Money(9.99, "USD")
println price
println price == new Money(9.99, "USD")

def range = new Interval(1, 10)
println "${range.low}..${range.high}"
