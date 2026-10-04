def words = ["apple", "avocado", "banana", "blueberry", "cherry", "apricot"]

println words.groupBy { it[0] }
println words.countBy { it.size() }
println words.collectEntries { [(it): it.size()] }.findAll { k, v -> v > 6 }
println words.split { it.startsWith("a") }
println words.sort(false) { a, b -> b.size() <=> a.size() ?: a <=> b }
println words.inject(0) { acc, w -> acc + w.size() }
println words.collate(4)
println words.take(2) + words.drop(4)
println words.findIndexOf { it == "cherry" }
println words.unique(false).any { it.contains("rr") }
