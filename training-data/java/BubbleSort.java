import java.util.Arrays;

public class BubbleSort {
    public static int[] sort(int[] items) {
        int[] arr = items.clone();
        for (int i = 0; i < arr.length; i++) {
            boolean swapped = false;
            for (int j = 0; j < arr.length - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int tmp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = tmp;
                    swapped = true;
                }
            }
            if (!swapped) break;
        }
        return arr;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(sort(new int[] {5, 3, 8, 1, 9, 2})));
    }
}
