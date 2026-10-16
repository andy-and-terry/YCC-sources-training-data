import java.util.NavigableMap;
import java.util.TreeMap;

public class TreeMapRangeViews {
    public static void main(String[] args) {
        TreeMap<Integer, String> grades = new TreeMap<>();
        grades.put(0, "F");
        grades.put(60, "D");
        grades.put(70, "C");
        grades.put(80, "B");
        grades.put(90, "A");

        int[] scores = {95, 85, 72, 61, 15};
        for (int s : scores) {
            System.out.println(s + " -> " + grades.floorEntry(s).getValue());
        }

        NavigableMap<Integer, String> passing = grades.tailMap(60, true);
        System.out.println("passing: " + passing);
        System.out.println("below 80: " + grades.headMap(80, false));
        System.out.println("descending: " + grades.descendingMap());
    }
}
