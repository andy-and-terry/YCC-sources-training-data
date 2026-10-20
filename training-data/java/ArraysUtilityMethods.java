import java.util.*;

public class ArraysUtilityMethods {
    public static void main(String[] args) {
        int[] a = {5, 3, 9, 1};
        Arrays.sort(a);
        System.out.println(Arrays.toString(a) + " " + Arrays.binarySearch(a, 5));
        int[] b = Arrays.copyOfRange(a, 1, 3);
        System.out.println(Arrays.toString(b) + Arrays.equals(a, b));
        int[][] g = new int[2][3];
        for (int[] r : g) Arrays.fill(r, 7);
        System.out.println(Arrays.deepToString(g) + " " + Arrays.stream(a).sum());
    }
}
