public class MergeSort {
    public static List<Integer> sort(List<Integer> arr) {
        if (arr.size() <= 1) {
            return arr;
        }
        Integer mid = arr.size() / 2;
        List<Integer> left = new List<Integer>();
        List<Integer> right = new List<Integer>();
        for (Integer i = 0; i < mid; i++) {
            left.add(arr[i]);
        }
        for (Integer i = mid; i < arr.size(); i++) {
            right.add(arr[i]);
        }
        return merge(sort(left), sort(right));
    }

    private static List<Integer> merge(List<Integer> left, List<Integer> right) {
        List<Integer> result = new List<Integer>();
        Integer i = 0, j = 0;
        while (i < left.size() && j < right.size()) {
            if (left[i] <= right[j]) {
                result.add(left[i++]);
            } else {
                result.add(right[j++]);
            }
        }
        while (i < left.size()) result.add(left[i++]);
        while (j < right.size()) result.add(right[j++]);
        return result;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{5, 3, 8, 1, 9, 2};
        System.debug(sort(arr));
    }
}
