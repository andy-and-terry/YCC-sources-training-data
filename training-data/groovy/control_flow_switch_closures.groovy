def classify(x) {
    switch (x) {
        case 0: return 'zero'
        case 1..9: return 'digit'
        case Integer: return 'int'
        case ~/ab+/: return 'regex'
        case String: return 'string'
        case [10, 20, 30]: return 'in list'
        case { it instanceof List }: return 'list'
        default: return 'other'
    }
}
println([0, 5, 100, 'abbb', 'zzz', 3.5, [1]].collect { classify(it) })
for (i in 1..3) print i
println()
10.step(0, -5) { print "$it " }
println()
3.times { print it }
println()
1.upto(3) { print it * 2 }
println()
def i = 0
while (i < 3) i++
println i
outer:
for (a in 1..3) { for (b in 1..3) { if (a * b == 4) break outer } }
try { Integer.parseInt('x') } catch (NumberFormatException e) { println 'nfe' } finally { println 'fin' }
try { throw new IllegalStateException('bad') } catch (IllegalStateException | IllegalArgumentException e) { println e.message }
assert 1 + 1 == 2
println(try { 1 / 0 } catch (ArithmeticException e) { 'div0' })
