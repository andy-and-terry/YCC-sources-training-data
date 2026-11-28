public class InsertInterval {
    public static List<List<Integer>> insertInterval(List<List<Integer>> iv, List<Integer> nw) {
        List<List<Integer>> result = new List<List<Integer>>();
        Integer lo = nw[0], hi = nw[1], i = 0;
        while (i < iv.size() && iv[i][1] < lo) result.add(iv[i++]);
        while (i < iv.size() && iv[i][0] <= hi) {
            lo = Math.min(lo, iv[i][0]);
            hi = Math.max(hi, iv[i][1]);
            i++;
        }
        result.add(new List<Integer>{lo, hi});
        while (i < iv.size()) result.add(iv[i++]);
        return result;
    }

    public static void demo() {
        System.debug(insertInterval(new List<List<Integer>>{ new List<Integer>{1, 3}, new List<Integer>{6, 9} },
                                    new List<Integer>{2, 5})); // ((1, 5), (6, 9))
    }
}
