import java.util.PriorityQueue;

public class KthLargestElement {
    public static int kthLargest(int[] nums, int k) {
        PriorityQueue<Integer> heap = new PriorityQueue<>();
        for (int num : nums) {
            heap.add(num);
            if (heap.size() > k) heap.poll();
        }
        return heap.peek();
    }

    public static void main(String[] args) {
        System.out.println(kthLargest(new int[] {3, 2, 1, 5, 6, 4}, 2));
    }
}
