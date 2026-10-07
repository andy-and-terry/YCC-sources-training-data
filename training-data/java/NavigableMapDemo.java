import java.util.Map;
import java.util.TreeMap;

public class NavigableMapDemo {
    public static void main(String[] args) {
        TreeMap<Integer, String> schedule = new TreeMap<>();
        schedule.put(9, "standup");
        schedule.put(13, "lunch review");
        schedule.put(15, "design sync");
        schedule.put(17, "wrap up");

        int now = 14;
        Map.Entry<Integer, String> next = schedule.ceilingEntry(now);
        Map.Entry<Integer, String> previous = schedule.floorEntry(now);
        System.out.println("previous: " + previous);
        System.out.println("next: " + next);

        System.out.println("before noon: " + schedule.headMap(12));
        System.out.println("from 13 onward: " + schedule.tailMap(13));
        System.out.println("first: " + schedule.firstEntry());
        System.out.println("last: " + schedule.lastEntry());

        System.out.println("descending: " + schedule.descendingKeySet());
    }
}
