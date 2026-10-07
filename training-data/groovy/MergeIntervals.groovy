def mergeIntervals(List<List<Integer>> intervals) {
    def out = []
    intervals.sort { it[0] }.each { iv ->
        if (out && iv[0] <= out.last()[1]) {
            out.last()[1] = Math.max(out.last()[1], iv[1])
        } else {
            out << [iv[0], iv[1]]
        }
    }
    out
}

println mergeIntervals([[1, 3], [8, 10], [2, 6], [15, 18]])
