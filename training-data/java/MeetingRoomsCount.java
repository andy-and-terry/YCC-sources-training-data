import java.util.Arrays;
import java.util.PriorityQueue;

public class MeetingRoomsCount {
    static int minRooms(int[][] meetings) {
        Arrays.sort(meetings, (x, y) -> Integer.compare(x[0], y[0]));
        PriorityQueue<Integer> ends = new PriorityQueue<>();
        for (int[] m : meetings) {
            if (!ends.isEmpty() && ends.peek() <= m[0]) ends.poll();
            ends.add(m[1]);
        }
        return ends.size();
    }

    public static void main(String[] args) {
        System.out.println(minRooms(new int[][]{{0, 30}, {5, 10}, {15, 20}}));
        System.out.println(minRooms(new int[][]{{7, 10}, {2, 4}}));
    }
}
