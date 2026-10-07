public class Quickselect {
    private static int partition(int[] nums, int low, int high) {
        int pivot = nums[high];
        int i = low;
        for (int j = low; j < high; j++) {
            if (nums[j] < pivot) {
                int tmp = nums[i];
                nums[i] = nums[j];
                nums[j] = tmp;
                i++;
            }
        }
        int tmp = nums[i];
        nums[i] = nums[high];
        nums[high] = tmp;
        return i;
    }

    // Returns the k-th smallest element (0-indexed) of nums.
    public static int quickselect(int[] nums, int k) {
        int low = 0, high = nums.length - 1;
        while (true) {
            int p = partition(nums, low, high);
            if (p == k) return nums[p];
            else if (p < k) low = p + 1;
            else high = p - 1;
        }
    }

    public static void main(String[] args) {
        int[] nums = {7, 10, 4, 3, 20, 15};
        System.out.println("3rd smallest: " + quickselect(nums, 2));
    }
}
