import java.util.Arrays;

public class ArraysUtilityDemo {
    public static void main(String[] args) {
        int[] a = {5, 3, 9, 1, 7};
        int[] copy = Arrays.copyOf(a, 7);
        Arrays.sort(a);
        System.out.println(Arrays.toString(a) + " " + Arrays.toString(copy));
        System.out.println(Arrays.binarySearch(a, 7) + " " + Arrays.binarySearch(a, 4));
        System.out.println(Arrays.equals(a, new int[] {1, 3, 5, 7, 9}));
        System.out.println(Arrays.stream(a).sum() + " " + Arrays.stream(a).max().getAsInt());

        int[] filled = new int[5];
        Arrays.fill(filled, 2);
        Arrays.setAll(filled, i -> filled[i] * i);
        System.out.println(Arrays.toString(filled));

        int[][] grid = {{1, 2}, {3, 4}};
        System.out.println(Arrays.deepToString(grid));
        System.out.println(Arrays.toString(Arrays.copyOfRange(a, 1, 4)));
        System.out.println(Arrays.mismatch(a, copy));
    }
}
