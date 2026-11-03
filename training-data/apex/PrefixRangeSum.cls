public class PrefixRangeSum {
    private List<Long> prefix = new List<Long>{ 0L };

    public PrefixRangeSum(List<Integer> values) {
        for (Integer v : values) {
            prefix.add(prefix[prefix.size() - 1] + v);
        }
    }

    public Long query(Integer lo, Integer hi) {
        return prefix[hi] - prefix[lo];
    }
}
