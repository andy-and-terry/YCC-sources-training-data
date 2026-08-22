import java.util.Arrays;

public class HeapSort {
    public static int[] sort(int[] items) {
        int[] arr = items.clone();
        int n = arr.length;
        for (int start = n / 2 - 1; start >= 0; start--) siftDown(arr, start, n - 1);
        for (int end = n - 1; end > 0; end--) {
            int tmp = arr[0];
            arr[0] = arr[end];
            arr[end] = tmp;
            siftDown(arr, 0, end - 1);
        }
        return arr;
    }

    private static void siftDown(int[] arr, int start, int end) {
        int root = start;
        while (2 * root + 1 <= end) {
            int child = 2 * root + 1;
            if (child + 1 <= end && arr[child] < arr[child + 1]) child++;
            if (arr[root] < arr[child]) {
                int tmp = arr[root];
                arr[root] = arr[child];
                arr[child] = tmp;
                root = child;
            } else {
                return;
            }
        }
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(sort(new int[] {5, 3, 8, 1, 9, 2})));
    }
}
