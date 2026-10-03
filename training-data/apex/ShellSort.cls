public class ShellSort {
    public static List<Integer> sort(List<Integer> input) {
        List<Integer> arr = input.clone();
        Integer n = arr.size();
        Integer gap = n / 2;

        while (gap > 0) {
            for (Integer i = gap; i < n; i++) {
                Integer temp = arr[i];
                Integer j = i;
                while (j >= gap && arr[j - gap] > temp) {
                    arr[j] = arr[j - gap];
                    j -= gap;
                }
                arr[j] = temp;
            }
            gap /= 2;
        }
        return arr;
    }

    public static void main() {
        List<Integer> data = new List<Integer>{9, 5, 1, 4, 8, 2, 7, 3, 6};
        System.debug(sort(data));
    }
}
