public class SelectionSort {
    public static List<Integer> sort(List<Integer> arr) {
        List<Integer> result = arr.clone();
        for (Integer i = 0; i < result.size() - 1; i++) {
            Integer minIdx = i;
            for (Integer j = i + 1; j < result.size(); j++) {
                if (result[j] < result[minIdx]) {
                    minIdx = j;
                }
            }
            Integer temp = result[i];
            result[i] = result[minIdx];
            result[minIdx] = temp;
        }
        return result;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{5, 3, 8, 1, 9, 2};
        System.debug(sort(arr));
    }
}
