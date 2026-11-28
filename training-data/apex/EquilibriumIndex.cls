public class EquilibriumIndex {
    public static Integer find(List<Integer> nums) {
        Integer total = 0, left = 0;
        for (Integer v : nums) total += v;
        for (Integer i = 0; i < nums.size(); i++) {
            if (left == total - left - nums[i]) return i;
            left += nums[i];
        }
        return -1;
    }

    public static void demo() {
        System.debug(find(new List<Integer>{1, 7, 3, 6, 5, 6})); // 3
    }
}
