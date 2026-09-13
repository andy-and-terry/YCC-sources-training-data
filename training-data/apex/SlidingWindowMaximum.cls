public class SlidingWindowMaximum {
    public static List<Integer> maxSlidingWindow(List<Integer> nums, Integer k) {
        List<Integer> result = new List<Integer>();
        List<Integer> deque = new List<Integer>();
        for (Integer i = 0; i < nums.size(); i++) {
            while (!deque.isEmpty() && nums[deque[deque.size() - 1]] <= nums[i]) {
                deque.remove(deque.size() - 1);
            }
            deque.add(i);
            if (deque[0] <= i - k) {
                deque.remove(0);
            }
            if (i >= k - 1) {
                result.add(nums[deque[0]]);
            }
        }
        return result;
    }

    public static void main() {
        List<Integer> nums = new List<Integer>{1, 3, -1, -3, 5, 3, 6, 7};
        System.debug(maxSlidingWindow(nums, 3));
    }
}
