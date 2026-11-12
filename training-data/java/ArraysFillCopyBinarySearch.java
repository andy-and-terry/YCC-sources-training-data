import java.util.Arrays;

public class ArraysFillCopyBinarySearch {
    public static void main(String[] args) {
        int[] a = new int[5];
        Arrays.fill(a, 7);
        int[] b = Arrays.copyOfRange(a, 1, 3);
        int[] sorted = {1, 3, 5, 7, 9};
        System.out.println(Arrays.toString(b) + " " + Arrays.binarySearch(sorted, 7) + " " + Arrays.binarySearch(sorted, 4));
    }
}
