def data = (1..10).toList()
println data.collate(4)
println data.collate(4, 4, false)
println data.collate(3, 1, false).take(3)
println data.collate(2).collect { it.sum() }
println data.withIndex().findAll { v, i -> i % 3 == 0 }*.getAt(0)
println data.split { it % 3 == 0 }
def windows = (0..data.size() - 3).collect { data[it..<it + 3] }
println windows.collect { it.sum() }
println data.tail().withIndex().collect { v, i -> v - data[i] }.unique()
