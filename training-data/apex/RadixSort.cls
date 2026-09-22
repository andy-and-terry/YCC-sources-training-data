public class RadixSort {
    private static Integer getMax(List<Integer> arr) {
        Integer maxVal = arr[0];
        for (Integer v : arr) {
            if (v > maxVal) {
                maxVal = v;
            }
        }
        return maxVal;
    }

    private static void countSortByDigit(List<Integer> arr, Integer exp) {
        Integer n = arr.size();
        List<Integer> output = new List<Integer>();
        List<Integer> count = new List<Integer>();
        for (Integer i = 0; i < n; i++) {
            output.add(0);
        }
        for (Integer i = 0; i < 10; i++) {
            count.add(0);
        }

        for (Integer i = 0; i < n; i++) {
            Integer digit = Math.mod(arr[i] / exp, 10);
            count[digit] = count[digit] + 1;
        }
        for (Integer i = 1; i < 10; i++) {
            count[i] = count[i] + count[i - 1];
        }
        for (Integer i = n - 1; i >= 0; i--) {
            Integer digit = Math.mod(arr[i] / exp, 10);
            count[digit] = count[digit] - 1;
            output[count[digit]] = arr[i];
        }
        for (Integer i = 0; i < n; i++) {
            arr[i] = output[i];
        }
    }

    public static List<Integer> sort(List<Integer> arr) {
        List<Integer> result = arr.clone();
        Integer maxVal = getMax(result);
        Integer exp = 1;
        while (maxVal / exp > 0) {
            countSortByDigit(result, exp);
            exp *= 10;
        }
        return result;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{170, 45, 75, 90, 802, 24, 2, 66};
        System.debug(sort(arr));
    }
}
