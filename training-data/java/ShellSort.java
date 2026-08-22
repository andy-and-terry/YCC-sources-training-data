import java.util.Arrays;

public class ShellSort {
    public static int[] sort(int[] items) {
        int[] arr = items.clone();
        int n = arr.length;
        for (int gap = n / 2; gap > 0; gap /= 2) {
            for (int i = gap; i < n; i++) {
                int temp = arr[i];
                int j = i;
                while (j >= gap && arr[j - gap] > temp) {
                    arr[j] = arr[j - gap];
                    j -= gap;
                }
                arr[j] = temp;
            }
        }
        return arr;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(sort(new int[] {5, 3, 8, 1, 9, 2})));
    }
}
