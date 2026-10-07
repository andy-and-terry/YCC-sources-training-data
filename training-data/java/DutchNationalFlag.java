import java.util.Arrays;

public class DutchNationalFlag {
    // Three-way partition of an array of 0s, 1s and 2s in a single pass:
    // `low` tracks the boundary after the last 0, `high` the boundary
    // before the first 2, and `mid` scans the unclassified middle region.
    static void sortColors(int[] nums) {
        int low = 0;
        int mid = 0;
        int high = nums.length - 1;

        while (mid <= high) {
            switch (nums[mid]) {
                case 0 -> {
                    swap(nums, low, mid);
                    low++;
                    mid++;
                }
                case 1 -> mid++;
                case 2 -> {
                    swap(nums, mid, high);
                    high--;
                }
                default -> throw new IllegalArgumentException("expected only 0, 1, or 2");
            }
        }
    }

    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    public static void main(String[] args) {
        int[] nums = {2, 0, 2, 1, 1, 0, 0, 2, 1};
        sortColors(nums);
        System.out.println(Arrays.toString(nums));

        int[] single = {1};
        sortColors(single);
        System.out.println(Arrays.toString(single));
    }
}
