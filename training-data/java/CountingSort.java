import java.util.Arrays;

public class CountingSort {
    public static int[] sort(int[] items) {
        if (items.length == 0) return items;
        int max = Arrays.stream(items).max().getAsInt();
        int[] counts = new int[max + 1];
        for (int x : items) counts[x]++;
        int[] result = new int[items.length];
        int idx = 0;
        for (int value = 0; value <= max; value++) {
            for (int c = 0; c < counts[value]; c++) result[idx++] = value;
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(sort(new int[] {5, 3, 8, 1, 9, 2, 3})));
    }
}
