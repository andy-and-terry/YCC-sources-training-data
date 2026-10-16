def scores = [alice: 90, bob: 72, carol: 85]
scores.each { k, v -> println "$k=$v" }
scores.eachWithIndex { e, i -> println "$i: ${e.key}" }
println scores.findAll { it.value > 80 }
println scores.collectEntries { k, v -> [(k.toUpperCase()): v + 5] }
println scores.max { it.value }.key
println scores.sort { -it.value }.keySet()
println scores.groupBy { it.value >= 80 ? 'pass' : 'fail' }
println scores.every { it.value > 50 }
println scores.any { it.value > 95 }
println scores.sum { it.value }
