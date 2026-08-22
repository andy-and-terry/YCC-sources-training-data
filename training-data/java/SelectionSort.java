import java.util.Arrays;

public class SelectionSort {
    public static int[] sort(int[] items) {
        int[] arr = items.clone();
        for (int i = 0; i < arr.length; i++) {
            int minIdx = i;
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[j] < arr[minIdx]) minIdx = j;
            }
            int tmp = arr[i];
            arr[i] = arr[minIdx];
            arr[minIdx] = tmp;
        }
        return arr;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(sort(new int[] {5, 3, 8, 1, 9, 2})));
    }
}
