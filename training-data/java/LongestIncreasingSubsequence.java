import java.util.Arrays;

public class LongestIncreasingSubsequence {
    public static int lengthOfLIS(int[] nums) {
        int[] tails = new int[nums.length];
        int size = 0;
        for (int num : nums) {
            int low = 0, high = size;
            while (low < high) {
                int mid = (low + high) / 2;
                if (tails[mid] < num) low = mid + 1;
                else high = mid;
            }
            tails[low] = num;
            if (low == size) size++;
        }
        return size;
    }

    public static void main(String[] args) {
        System.out.println(lengthOfLIS(new int[] {10, 9, 2, 5, 3, 7, 101, 18}));
    }
}
