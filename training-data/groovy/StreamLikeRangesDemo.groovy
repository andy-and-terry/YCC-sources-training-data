println (1..10).step(3)
println (10..1).step(4).toList()
println (1..<5).toList()
println ('a'..'e').toList()
println (1..20).findAll { it % 3 == 0 }
println (1..5).collect { it ** 2 }
println (1..5).sum()
println (1..5).inject(1) { a, b -> a * b }
println (1..10).collate(4)
println (1..6).collate(2).collect { it.sum() }
println [3, 1, 2].withIndex().collect { v, i -> "$i:$v" }
println (1..4).collectMany { [it, -it] }
println [1, 2, 3].transpose()
