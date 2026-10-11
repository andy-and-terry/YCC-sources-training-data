import groovy.transform.*

@TupleConstructor(includes = 'x,y')
@Canonical
class P {
    int x
    int y
    int z = 7
}
def p = new P(1, 2)
println p
println new P(x: 5, y: 6)
println p.z

@MapConstructor
class Q { String a; int b }
println new Q(a: 'z', b: 2).b

@Immutable
class Money {
    BigDecimal amount
    String cur
}
def m = new Money(10.5, 'USD')
println m
try { m.amount = 1 } catch (ReadOnlyPropertyException e) { println 'immutable' }
