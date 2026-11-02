import java.util.TreeMap;

public class TreeMapNavigableX2 {
    public static void main(String[] args) {
        TreeMap<Integer, String> t = new TreeMap<>();
        t.put(10, "a"); t.put(20, "b"); t.put(30, "c");
        System.out.println(t.floorKey(25) + " " + t.ceilingKey(25) + " " + t.headMap(20));
    }
}
