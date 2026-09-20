public class QuickSelect {
    private static void swap(List<Integer> arr, Integer i, Integer j) {
        Integer temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    private static Integer partition(List<Integer> arr, Integer low, Integer high) {
        Integer pivot = arr[high];
        Integer i = low - 1;
        for (Integer j = low; j < high; j++) {
            if (arr[j] <= pivot) {
                i++;
                swap(arr, i, j);
            }
        }
        swap(arr, i + 1, high);
        return i + 1;
    }

    // Returns the k-th smallest element (0-indexed) of arr.
    public static Integer select(List<Integer> arr, Integer low, Integer high, Integer k) {
        if (low == high) {
            return arr[low];
        }
        Integer pivotIndex = partition(arr, low, high);
        if (k == pivotIndex) {
            return arr[k];
        } else if (k < pivotIndex) {
            return select(arr, low, pivotIndex - 1, k);
        } else {
            return select(arr, pivotIndex + 1, high, k);
        }
    }

    public static void main() {
        List<Integer> data = new List<Integer>{7, 10, 4, 3, 20, 15};
        System.debug(select(data, 0, data.size() - 1, 2)); // 3rd smallest -> 7
    }
}
