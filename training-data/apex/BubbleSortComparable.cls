public class BubbleSortComparable {
    public static List<Integer> sort(List<Integer> arr) {
        List<Integer> result = arr.clone();
        Integer n = result.size();
        for (Integer i = 0; i < n - 1; i++) {
            Boolean swapped = false;
            for (Integer j = 0; j < n - i - 1; j++) {
                if (result[j] > result[j + 1]) {
                    Integer temp = result[j];
                    result[j] = result[j + 1];
                    result[j + 1] = temp;
                    swapped = true;
                }
            }
            if (!swapped) {
                break;
            }
        }
        return result;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{5, 3, 8, 1, 9, 2};
        System.debug(sort(arr));
    }
}
