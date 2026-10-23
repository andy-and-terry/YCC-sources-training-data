// Groovy offers several ways to iterate with an index.
def fruits = ['apple', 'banana', 'cherry']

// eachWithIndex: closure receives element then index
fruits.eachWithIndex { fruit, i -> println "$i: $fruit" }

// indexed() returns a Map of index -> element (Groovy 2.4+)
println fruits.indexed()
println fruits.indexed(1)

fruits.indexed(1).each { i, fruit -> println "#$i $fruit" }

// collect with indices through indexed()
def labels = fruits.indexed().collect { i, f -> "${i}-${f[0]}" }
println labels

// withIndex() produces [element, index] pairs (Groovy 3+)
println fruits.withIndex().collect { f, i -> f * (i + 1) }

// findIndexOf / findIndexValues / indexOf
def nums = [4, 9, 16, 25, 36]
println nums.findIndexOf { it > 10 }
println nums.findIndexValues { it % 2 == 0 }
println nums.indexOf(25)
println nums.findLastIndexOf { it < 30 }

// iterate a map with index
def prices = [tea: 2.5, coffee: 3.0]
prices.eachWithIndex { entry, i -> println "$i ${entry.key}=${entry.value}" }
