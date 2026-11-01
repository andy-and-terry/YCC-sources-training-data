def m = [a: 1, b: 2]
m.c = 3
m['d'] = 4
m.each { k, v -> println "$k=$v" }
println m.findAll { it.value > 2 }
println m.collectEntries { k, v -> [(k.toUpperCase()): v * 10] }
println m.getOrDefault('z', -1)
