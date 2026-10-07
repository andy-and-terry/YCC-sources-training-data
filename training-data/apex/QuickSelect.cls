public class QuickSelect {
    private static void swap(List<Integer> arr, Integer i, Integer j) {
        Integer temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    private static Integer partition(List<Integer> arr, Integer left, Integer right) {
        Integer pivot = arr[right];
        Integer storeIndex = left;
        for (Integer i = left; i < right; i++) {
            if (arr[i] < pivot) {
                swap(arr, i, storeIndex);
                storeIndex++;
            }
        }
        swap(arr, storeIndex, right);
        return storeIndex;
    }

    // Returns the k-th smallest element (0-indexed) without fully sorting the list.
    public static Integer select(List<Integer> arr, Integer k) {
        Integer left = 0;
        Integer right = arr.size() - 1;
        while (true) {
            if (left == right) {
                return arr[left];
            }
            Integer pivotIndex = partition(arr, left, right);
            if (k == pivotIndex) {
                return arr[k];
            } else if (k < pivotIndex) {
                right = pivotIndex - 1;
            } else {
                left = pivotIndex + 1;
            }
        }
    }

    public static void main() {
        List<Integer> values = new List<Integer>{ 7, 2, 9, 4, 1, 8, 3 };
        System.debug(QuickSelect.select(new List<Integer>(values), 0));
        System.debug(QuickSelect.select(new List<Integer>(values), 3));
        System.debug(QuickSelect.select(new List<Integer>(values), 6));
    }
}
