def m = [a: 1, b: 2, c: 3]
m.d = 4
m['e'] = 5
println m
println m.findAll { k, v -> v % 2 == 0 }
println m.collectEntries { k, v -> [(k.toUpperCase()): v * 10] }
println m.subMap(['a', 'c'])
println m.getOrDefault('z', -1)
println m.get('q') { 99 }

def counts = [:].withDefault { 0 }
'mississippi'.each { counts[it]++ }
println counts
println counts.sort { -it.value }.keySet().first()
m.each { k, v -> print "$k=$v " }
println()
println m.entrySet().find { it.value > 3 }.key
