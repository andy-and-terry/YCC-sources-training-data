public class PermutationsGenerator {
    public static List<List<Integer>> permute(List<Integer> nums) {
        List<List<Integer>> result = new List<List<Integer>>();
        backtrack(nums, 0, result);
        return result;
    }

    private static void backtrack(List<Integer> nums, Integer start, List<List<Integer>> result) {
        if (start == nums.size()) {
            result.add(nums.clone());
            return;
        }
        for (Integer i = start; i < nums.size(); i++) {
            swap(nums, start, i);
            backtrack(nums, start + 1, result);
            swap(nums, start, i);
        }
    }

    private static void swap(List<Integer> nums, Integer i, Integer j) {
        Integer temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }

    public static void main() {
        System.debug(permute(new List<Integer>{1, 2, 3}));
    }
}
