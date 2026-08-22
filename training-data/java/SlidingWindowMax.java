import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

public class SlidingWindowMax {
    public static List<Integer> maxSlidingWindow(int[] nums, int k) {
        Deque<Integer> dq = new ArrayDeque<>();
        List<Integer> result = new ArrayList<>();
        for (int i = 0; i < nums.length; i++) {
            while (!dq.isEmpty() && nums[dq.peekLast()] <= nums[i]) dq.pollLast();
            dq.addLast(i);
            if (dq.peekFirst() <= i - k) dq.pollFirst();
            if (i >= k - 1) result.add(nums[dq.peekFirst()]);
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(maxSlidingWindow(new int[] {1, 3, -1, -3, 5, 3, 6, 7}, 3));
    }
}
