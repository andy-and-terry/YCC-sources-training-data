import java.util.Collections;
import java.util.PriorityQueue;

public class MedianOfStream {
    private final PriorityQueue<Integer> small = new PriorityQueue<>(Collections.reverseOrder());
    private final PriorityQueue<Integer> large = new PriorityQueue<>();

    public void addNum(int num) {
        small.add(num);
        large.add(small.poll());
        if (large.size() > small.size()) small.add(large.poll());
    }

    public double findMedian() {
        if (small.size() > large.size()) return small.peek();
        return (small.peek() + large.peek()) / 2.0;
    }

    public static void main(String[] args) {
        MedianOfStream mf = new MedianOfStream();
        for (int n : new int[] {5, 15, 1, 3}) mf.addNum(n);
        System.out.println(mf.findMedian());
    }
}
