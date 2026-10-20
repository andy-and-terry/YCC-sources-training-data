import java.util.*;

public class TreeMapNavigation {
    public static void main(String[] args) {
        TreeMap<Integer, String> m = new TreeMap<>(Map.of(10, "a", 20, "b", 30, "c"));
        System.out.println(m.floorKey(25) + " " + m.ceilingKey(25) + " " + m.headMap(20) + " " + m.tailMap(20, true));
        System.out.println(m.firstEntry() + " " + m.descendingMap());
    }
}
