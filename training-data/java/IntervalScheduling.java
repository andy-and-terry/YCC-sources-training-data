import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.PriorityQueue;

public class IntervalScheduling {
    record Interval(int start, int end) {}

    public static List<Interval> maxNonOverlapping(List<Interval> intervals) {
        List<Interval> sorted = new ArrayList<>(intervals);
        sorted.sort(Comparator.comparingInt(Interval::end));
        List<Interval> chosen = new ArrayList<>();
        int end = Integer.MIN_VALUE;
        for (Interval iv : sorted) {
            if (iv.start() >= end) {
                chosen.add(iv);
                end = iv.end();
            }
        }
        return chosen;
    }

    /** Minimum number of rooms: a min-heap of end times of meetings in progress. */
    public static int minRooms(List<Interval> intervals) {
        Interval[] a = intervals.toArray(Interval[]::new);
        Arrays.sort(a, Comparator.comparingInt(Interval::start));
        PriorityQueue<Integer> ends = new PriorityQueue<>();
        for (Interval iv : a) {
            if (!ends.isEmpty() && ends.peek() <= iv.start()) ends.poll();
            ends.add(iv.end());
        }
        return ends.size();
    }

    public static void main(String[] args) {
        List<Interval> m = List.of(new Interval(1, 4), new Interval(3, 5), new Interval(0, 6), new Interval(5, 7),
                new Interval(3, 9), new Interval(5, 9), new Interval(6, 10), new Interval(8, 11), new Interval(8, 12),
                new Interval(2, 14), new Interval(12, 16));
        System.out.println(maxNonOverlapping(m));
        System.out.println("rooms: " + minRooms(m));
    }
}
