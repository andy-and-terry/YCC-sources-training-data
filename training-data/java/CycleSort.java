import java.util.Arrays;

public class CycleSort {
    /** Sorts with the theoretical minimum number of writes; returns the write count. */
    public static int sort(int[] a) {
        int writes = 0;
        for (int start = 0; start < a.length - 1; start++) {
            int item = a[start];
            int pos = position(a, item, start);
            if (pos == start) continue;
            while (item == a[pos]) pos++;
            int tmp = a[pos]; a[pos] = item; item = tmp;
            writes++;
            while (pos != start) {
                pos = position(a, item, start);
                while (item == a[pos]) pos++;
                tmp = a[pos]; a[pos] = item; item = tmp;
                writes++;
            }
        }
        return writes;
    }

    private static int position(int[] a, int item, int start) {
        int pos = start;
        for (int i = start + 1; i < a.length; i++) if (a[i] < item) pos++;
        return pos;
    }

    public static void main(String[] args) {
        int[] data = {1, 8, 3, 9, 10, 10, 2, 4};
        int writes = sort(data);
        System.out.println(Arrays.toString(data) + " writes: " + writes);
    }
}
