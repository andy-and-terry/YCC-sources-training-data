class RangeSum {
    List<Long> prefix = [0L]
    RangeSum(List<Integer> values) { values.each { prefix << prefix.last() + it } }
    long query(int lo, int hi) { prefix[hi] - prefix[lo] }
}
println new RangeSum([3, 1, 4, 1, 5, 9, 2, 6]).query(2, 5)
