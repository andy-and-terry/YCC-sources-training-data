int lisLength(List<Integer> a) {
    def tails = []
    a.each { x ->
        int i = tails.findIndexOf { it >= x }
        if (i < 0) tails << x else tails[i] = x
    }
    tails.size()
}
println lisLength([10, 9, 2, 5, 3, 7, 101, 18])
