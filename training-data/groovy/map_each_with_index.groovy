def m = [a: 1, b: 2]
m.each { k, v -> println "$k=$v" }
m.eachWithIndex { e, i -> println "$i:${e.key}" }
println m.collectEntries { k, v -> [(k.toUpperCase()): v * 10] }
