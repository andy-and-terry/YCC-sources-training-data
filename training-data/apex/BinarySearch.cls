public class BinarySearch {
    public static Integer search(List<Integer> arr, Integer target) {
        Integer low = 0;
        Integer high = arr.size() - 1;
        while (low <= high) {
            Integer mid = (low + high) / 2;
            if (arr[mid] == target) {
                return mid;
            } else if (arr[mid] < target) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return -1;
    }
}
