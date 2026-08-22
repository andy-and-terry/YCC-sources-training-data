public class BinarySearchVariants {
    public static int binarySearch(int[] items, int target) {
        int low = 0, high = items.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            if (items[mid] == target) return mid;
            if (items[mid] < target) low = mid + 1;
            else high = mid - 1;
        }
        return -1;
    }

    public static int lowerBound(int[] items, int target) {
        int low = 0, high = items.length;
        while (low < high) {
            int mid = (low + high) / 2;
            if (items[mid] < target) low = mid + 1;
            else high = mid;
        }
        return low;
    }

    public static int upperBound(int[] items, int target) {
        int low = 0, high = items.length;
        while (low < high) {
            int mid = (low + high) / 2;
            if (items[mid] <= target) low = mid + 1;
            else high = mid;
        }
        return low;
    }

    public static void main(String[] args) {
        int[] data = {1, 2, 2, 2, 3, 5, 8};
        System.out.println(binarySearch(data, 5));
        System.out.println(lowerBound(data, 2) + " " + upperBound(data, 2));
    }
}
