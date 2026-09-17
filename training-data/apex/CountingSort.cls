public class CountingSort {
    public static List<Integer> sort(List<Integer> data, Integer maxValue) {
        List<Integer> counts = new List<Integer>();
        for (Integer i = 0; i <= maxValue; i++) {
            counts.add(0);
        }
        for (Integer value : data) {
            counts[value] = counts[value] + 1;
        }
        List<Integer> result = new List<Integer>();
        for (Integer value = 0; value <= maxValue; value++) {
            for (Integer occurrence = 0; occurrence < counts[value]; occurrence++) {
                result.add(value);
            }
        }
        return result;
    }

    public static void main() {
        List<Integer> data = new List<Integer>{5, 2, 9, 1, 5, 6, 0, 3};
        System.debug(sort(data, 9));
    }
}
