def words = ['apple', 'avocado', 'banana', 'cherry', 'cranberry']
println words.groupBy { it[0] }
println words.countBy { it.size() }
println words.inject(0) { acc, w -> acc + w.size() }
