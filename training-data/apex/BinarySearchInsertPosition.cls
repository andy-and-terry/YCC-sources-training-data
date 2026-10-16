public class BinarySearchInsertPosition {
    public static Integer searchInsert(List<Integer> sorted, Integer target) {
        Integer lo = 0;
        Integer hi = sorted.size();
        while (lo < hi) {
            Integer mid = lo + (hi - lo) / 2;
            if (sorted[mid] < target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }

    public static void main() {
        List<Integer> data = new List<Integer>{ 1, 3, 5, 6 };
        System.debug(searchInsert(data, 5));
        System.debug(searchInsert(data, 2));
        System.debug(searchInsert(data, 7));
    }
}
