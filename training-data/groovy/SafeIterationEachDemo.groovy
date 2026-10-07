def m = [a: 1, b: 2, c: 3]

m.each { k, v -> println "$k=$v" }
m.eachWithIndex { e, i -> println "$i:${e.key}" }
println m.collect { k, v -> "$k$v" }
println m.findAll { it.value > 1 }.keySet()
println m.sort { -it.value }.keySet()
println m.max { it.value }.key
println m.subMap(["a", "c"])
println m.withDefault { 0 }.z
println m.inject(0) { s, e -> s + e.value }

(1..10).step(3) { print "$it " }
println()
10.downto(7) { print "$it " }
println()
1.upto(3) { print it * it + " " }
println()
