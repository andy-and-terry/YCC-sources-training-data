import java.util.Arrays;

public class RotateArray {
    public static int[] rotate(int[] nums, int k) {
        int n = nums.length;
        k = ((k % n) + n) % n;
        int[] result = new int[n];
        for (int i = 0; i < n; i++) {
            result[(i + k) % n] = nums[i];
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(rotate(new int[] {1, 2, 3, 4, 5, 6, 7}, 3)));
    }
}
