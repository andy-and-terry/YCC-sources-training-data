def find(list, target) {
    def idx = -1
    list.eachWithIndex { v, i ->
        if (v == target && idx < 0) idx = i
    }
    idx
}
println find([5, 6, 7], 6)

def firstEven(list) {
    for (n in list) if (n % 2 == 0) return n
    null
}
println firstEven([1, 3, 4, 6])

def c = { x -> if (x < 0) return 'neg'; 'non-neg' }
println c(-1)
println c(1)

println [1, 2, 3, 4].find { it > 2 }
println [1, 2, 3, 4].findIndexOf { it > 2 }
println [1, 2, 3, 4].takeWhile { it < 3 }
