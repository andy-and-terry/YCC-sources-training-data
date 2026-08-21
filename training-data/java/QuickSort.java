import java.util.Arrays;

public class QuickSort {
    public static void sort(int[] items, int low, int high) {
        if (low >= high) return;
        int pivot = items[(low + high) / 2];
        int i = low, j = high;
        while (i <= j) {
            while (items[i] < pivot) i++;
            while (items[j] > pivot) j--;
            if (i <= j) {
                int tmp = items[i];
                items[i] = items[j];
                items[j] = tmp;
                i++;
                j--;
            }
        }
        sort(items, low, j);
        sort(items, i, high);
    }

    public static void main(String[] args) {
        int[] data = {5, 3, 8, 1, 9, 2};
        sort(data, 0, data.length - 1);
        System.out.println(Arrays.toString(data));
    }
}
