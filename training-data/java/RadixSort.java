import java.util.Arrays;

public class RadixSort {
    public static int[] sort(int[] items) {
        if (items.length == 0) return items;
        int[] arr = items.clone();
        int max = Arrays.stream(arr).max().getAsInt();
        for (int exp = 1; max / exp > 0; exp *= 10) {
            arr = countingSortByDigit(arr, exp);
        }
        return arr;
    }

    private static int[] countingSortByDigit(int[] arr, int exp) {
        int[] output = new int[arr.length];
        int[] count = new int[10];
        for (int x : arr) count[(x / exp) % 10]++;
        for (int i = 1; i < 10; i++) count[i] += count[i - 1];
        for (int i = arr.length - 1; i >= 0; i--) {
            int digit = (arr[i] / exp) % 10;
            output[--count[digit]] = arr[i];
        }
        return output;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(sort(new int[] {170, 45, 75, 90, 802, 24, 2, 66})));
    }
}
