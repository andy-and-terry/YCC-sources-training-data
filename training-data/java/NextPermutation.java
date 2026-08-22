import java.util.Arrays;

public class NextPermutation {
    public static int[] nextPermutation(int[] nums) {
        int[] arr = nums.clone();
        int i = arr.length - 2;
        while (i >= 0 && arr[i] >= arr[i + 1]) i--;
        if (i >= 0) {
            int j = arr.length - 1;
            while (arr[j] <= arr[i]) j--;
            int tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
        for (int lo = i + 1, hi = arr.length - 1; lo < hi; lo++, hi--) {
            int tmp = arr[lo];
            arr[lo] = arr[hi];
            arr[hi] = tmp;
        }
        return arr;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(nextPermutation(new int[] {1, 2, 3})));
        System.out.println(Arrays.toString(nextPermutation(new int[] {3, 2, 1})));
    }
}
