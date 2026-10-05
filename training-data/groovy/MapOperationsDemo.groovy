def m = [a: 1, b: 2, c: 3]

m.d = 4
m['e'] = 5
println m
println m.findAll { k, v -> v % 2 == 0 }
println m.collectEntries { k, v -> [(k.toUpperCase()): v * 10] }
println m.subMap(['a', 'c'])
println m.groupBy { k, v -> v % 2 ? 'odd' : 'even' }
println m.sort { -it.value }.keySet()
println "${m.getOrDefault('z', 0)} ${m.get('z', 99)}"
println m.inject(0) { acc, k, v -> acc + v }
println m.max { it.value }
m.each { k, v -> print "$k=$v " }
println()
m.eachWithIndex { entry, i -> print "$i:${entry.key} " }
println()
m.remove('a')
println(m.keySet() + m.values())
println(m.containsKey('b') && m.containsValue(5))
println ([x: 1] + [y: 2])
