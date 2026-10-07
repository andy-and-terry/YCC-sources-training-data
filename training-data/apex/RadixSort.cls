public class RadixSort {
    public static List<Integer> sort(List<Integer> input) {
        List<Integer> result = input.clone();
        Integer maxValue = 0;
        for (Integer v : result) {
            maxValue = Math.max(maxValue, v);
        }

        for (Integer exp = 1; maxValue / exp > 0; exp *= 10) {
            result = countingPass(result, exp);
        }
        return result;
    }

    private static List<Integer> countingPass(List<Integer> input, Integer exp) {
        List<Integer> output = new List<Integer>();
        for (Integer i = 0; i < input.size(); i++) {
            output.add(0);
        }

        Integer[] count = new Integer[10];
        for (Integer i = 0; i < 10; i++) {
            count[i] = 0;
        }
        for (Integer v : input) {
            count[(v / exp) mod 10]++;
        }
        for (Integer i = 1; i < 10; i++) {
            count[i] += count[i - 1];
        }
        for (Integer i = input.size() - 1; i >= 0; i--) {
            Integer digit = (input[i] / exp) mod 10;
            output[count[digit] - 1] = input[i];
            count[digit]--;
        }
        return output;
    }

    public static void main() {
        List<Integer> data = new List<Integer>{170, 45, 75, 90, 802, 24, 2, 66};
        System.debug(sort(data));
    }
}
