int fourSumCount(List<Integer> a, List<Integer> b, List<Integer> c, List<Integer> d) {
    def sums = [:].withDefault { 0 }
    a.each { x -> b.each { y -> sums[x + y]++ } }
    int count = 0
    c.each { x -> d.each { y -> count += sums.containsKey(-(x + y)) ? sums[-(x + y)] : 0 } }
    count
}

println fourSumCount([1, 2], [-2, -1], [-1, 2], [0, 2]) // 2
