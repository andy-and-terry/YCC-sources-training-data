import java.util.Arrays;

public class ArraysUtilityDemo {
    public static void main(String[] args) {
        int[] a = {5, 3, 9, 1, 7};
        int[] copy = Arrays.copyOf(a, 7);
        int[] slice = Arrays.copyOfRange(a, 1, 4);
        System.out.println(Arrays.toString(copy) + " " + Arrays.toString(slice));

        Arrays.sort(a);
        System.out.println(Arrays.toString(a));
        System.out.println("index of 7: " + Arrays.binarySearch(a, 7));
        System.out.println("insertion point for 4: " + Arrays.binarySearch(a, 4));

        int[] filled = new int[5];
        Arrays.fill(filled, 42);
        System.out.println(Arrays.equals(filled, new int[]{42, 42, 42, 42, 42}));

        Arrays.setAll(filled, i -> i * i);
        System.out.println(Arrays.toString(filled) + " sum=" + Arrays.stream(filled).sum());

        int[][] grid = {{1, 2}, {3, 4}};
        System.out.println(Arrays.deepToString(grid));
        System.out.println(Arrays.mismatch(a, new int[]{1, 3, 5}));
        System.out.println(Arrays.hashCode(new int[]{1, 2, 3}));
    }
}
