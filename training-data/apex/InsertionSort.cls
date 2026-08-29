public class InsertionSort {
    public static List<Integer> sort(List<Integer> arr) {
        List<Integer> result = arr.clone();
        for (Integer i = 1; i < result.size(); i++) {
            Integer key = result[i];
            Integer j = i - 1;
            while (j >= 0 && result[j] > key) {
                result[j + 1] = result[j];
                j--;
            }
            result[j + 1] = key;
        }
        return result;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{5, 3, 8, 1, 9, 2};
        System.debug(sort(arr));
    }
}
