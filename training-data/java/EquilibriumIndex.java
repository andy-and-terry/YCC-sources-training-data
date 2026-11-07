public class EquilibriumIndex {
    static int find(int[] nums) {
        long total = 0, left = 0;
        for (int v : nums) total += v;
        for (int i = 0; i < nums.length; i++) {
            if (left == total - left - nums[i]) return i;
            left += nums[i];
        }
        return -1;
    }

    public static void main(String[] args) {
        System.out.println(find(new int[] {1, 7, 3, 6, 5, 6})); // 3
    }
}
