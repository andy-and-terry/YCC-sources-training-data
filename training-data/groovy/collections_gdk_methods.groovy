def list = [5, 3, 8, 1, 9]
println list.sort(false)
println list.findAll { it > 4 }
println list.find { it > 5 }
println list.collect { it * 2 }
println list.sum() + " " + list.max() + " " + list.min()
println list.groupBy { it % 2 == 0 ? 'even' : 'odd' }
println list.split { it > 4 }
println list.take(2) + list.drop(3)
println list.indexOf(8) + " " + list.contains(9) + " " + list.any { it > 8 } + " " + list.every { it > 0 }
println list.countBy { it % 3 }
println list.collate(2)
println list.withIndex().collect { v, i -> "$i:$v" }
println list.inject('') { acc, v -> acc + v }
println list.toSet().size() + " " + list.reverse() + " " + list.unique()
println list[1..3] + list[-1] + list[0, 2]
def m = [a: 1, b: 2, c: 3]
println m.findAll { k, v -> v > 1 }
println m.collectEntries { k, v -> [(k.toUpperCase()): v * 10] }
println m.keySet() + " " + m.values() + " " + m.getOrDefault('z', 0)
m.each { k, v -> print "$k=$v " }
println()
println m.sort { -it.value }
println (1..5).step(2).toList() + " " + (1..<4).toList() + " " + ('a'..'e').toList()
