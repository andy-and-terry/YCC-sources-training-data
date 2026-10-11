def m = [c: 3, a: 1, b: 2]
println m.keySet()
println m.sort().keySet()
println m.sort { -it.value }.keySet()
m.d = 4
println m
m.remove('a')
println m
println m.entrySet().first()
println m.collect { k, v -> "$k$v" }.join()
println m.subMap(['b', 'c'])
println m.findAll { k, v -> v > 2 }
println([m.containsKey('z'), m.containsValue(4)])
println m.getOrDefault('z', 0)
println m.withDefault { 99 }.nope
