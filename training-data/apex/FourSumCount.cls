public class FourSumCount {
    public static Integer count(List<Integer> a, List<Integer> b, List<Integer> c, List<Integer> d) {
        Map<Integer, Integer> sums = new Map<Integer, Integer>();
        for (Integer x : a) {
            for (Integer y : b) {
                Integer k = x + y;
                sums.put(k, sums.containsKey(k) ? sums.get(k) + 1 : 1);
            }
        }
        Integer total = 0;
        for (Integer x : c) {
            for (Integer y : d) {
                Integer k = -(x + y);
                if (sums.containsKey(k)) total += sums.get(k);
            }
        }
        return total;
    }

    public static void demo() {
        System.debug(count(new List<Integer>{1, 2}, new List<Integer>{-2, -1},
                           new List<Integer>{-1, 2}, new List<Integer>{0, 2})); // 2
    }
}
