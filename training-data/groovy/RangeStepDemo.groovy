println (1..5).toList()
println (1..<5).toList()
println (5..1).toList()
println 'a'..'e'

(0..10).step(3) { print "$it " }
println()

1.step(10, 4) { print "$it " }
println()

println((1..20).findAll { it % 7 == 0 })
println((1..5).contains(3))
