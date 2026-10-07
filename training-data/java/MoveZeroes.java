import java.util.Arrays;

public class MoveZeroes {
    public static void moveZeroes(int[] nums) {
        int write = 0;
        for (int x : nums) if (x != 0) nums[write++] = x;
        Arrays.fill(nums, write, nums.length, 0);
    }

    public static void main(String[] args) {
        int[] a = {0, 1, 0, 3, 12, 0, 7};
        moveZeroes(a);
        System.out.println(Arrays.toString(a));
    }
}
