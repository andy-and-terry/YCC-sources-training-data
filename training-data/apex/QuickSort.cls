public class QuickSort {
    public static List<Integer> sort(List<Integer> items) {
        if (items.size() <= 1) {
            return items;
        }
        Integer pivot = items[items.size() / 2];
        List<Integer> smaller = new List<Integer>();
        List<Integer> mid = new List<Integer>();
        List<Integer> larger = new List<Integer>();

        for (Integer x : items) {
            if (x < pivot) {
                smaller.add(x);
            } else if (x == pivot) {
                mid.add(x);
            } else {
                larger.add(x);
            }
        }

        List<Integer> result = sort(smaller);
        result.addAll(mid);
        result.addAll(sort(larger));
        return result;
    }
}
