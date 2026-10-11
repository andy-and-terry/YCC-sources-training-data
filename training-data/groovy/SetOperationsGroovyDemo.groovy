def a = [1, 2, 3, 4] as Set
def b = [3, 4, 5, 6] as Set
println a + b
println a.intersect(b)
println a - b
println (a + b) - a.intersect(b)
println a.disjoint([9, 10] as Set)
println a.containsAll([1, 2])
println a.subsetOf(a + b)
println a.collect { it * 2 } as Set
println new TreeSet(b).descendingSet()
println([a.isEmpty(), a.size()])
