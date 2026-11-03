public class ListMode {
    public static List<Integer> modes(List<Integer> items) {
        Map<Integer, Integer> counts = new Map<Integer, Integer>();
        Integer top = 0;
        for (Integer x : items) {
            Integer c = counts.containsKey(x) ? counts.get(x) + 1 : 1;
            counts.put(x, c);
            if (c > top) top = c;
        }
        List<Integer> result = new List<Integer>();
        for (Integer k : counts.keySet()) {
            if (counts.get(k) == top) result.add(k);
        }
        result.sort();
        return result;
    }
}
