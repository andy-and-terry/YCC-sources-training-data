import java.util.Arrays;

public class DutchFlagPartition {
    enum Color { RED, WHITE, BLUE }

    public static void sort(Color[] a) {
        int lo = 0, mid = 0, hi = a.length - 1;
        while (mid <= hi) {
            switch (a[mid]) {
                case RED -> swap(a, lo++, mid++);
                case WHITE -> mid++;
                case BLUE -> swap(a, mid, hi--);
            }
        }
    }

    private static <T> void swap(T[] a, int i, int j) {
        T t = a[i];
        a[i] = a[j];
        a[j] = t;
    }

    public static void main(String[] args) {
        Color[] flags = {Color.BLUE, Color.RED, Color.WHITE, Color.BLUE, Color.RED, Color.WHITE, Color.RED};
        sort(flags);
        System.out.println(Arrays.toString(flags));
    }
}
