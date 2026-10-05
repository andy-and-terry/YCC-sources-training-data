def words = ['apple', 'avocado', 'banana', 'blueberry', 'cherry', 'apricot']

println words.groupBy { it[0] }
println words.countBy { it.size() }
println words.collectEntries { [(it): it.size()] }.findAll { k, v -> v > 6 }
println words.inject(0) { acc, w -> acc + w.size() }
println words.findAll { it.startsWith('a') }.sort(false) { a, b -> b <=> a }
println words.collate(4)
println words.indexed().findAll { i, w -> i % 2 == 0 }.values()
println "${words.min { it.size() }} ${words.max { it.size() }}"
println "${words.any { it.contains('rr') }} ${words.every { it.size() > 4 }}"
println words.take(2) + words.drop(4)
println words.sum { it.size() }
println words.unique(false) { it[0] }
