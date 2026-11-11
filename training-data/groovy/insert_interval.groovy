def insertInterval(List<List<Integer>> iv, List<Integer> nw) {
    def before = iv.findAll { it[1] < nw[0] }
    def after = iv.findAll { it[0] > nw[1] }
    def overlap = iv - before - after
    def merged = [([nw[0]] + overlap*.get(0)).min(), ([nw[1]] + overlap*.get(1)).max()]
    before + [merged] + after
}

println insertInterval([[1, 3], [6, 9]], [2, 5]) // [[1, 5], [6, 9]]
