import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CollectionsUtilityDemo {
    public static void main(String[] args) {
        List<Integer> xs = new ArrayList<>(List.of(4, 1, 7, 3));
        Collections.sort(xs);
        System.out.println(xs + " " + Collections.binarySearch(xs, 4));
        Collections.reverse(xs);
        Collections.swap(xs, 0, 3);
        System.out.println(xs + " " + Collections.max(xs) + " " + Collections.min(xs));
        Collections.rotate(xs, 1);
        System.out.println(xs + " freq=" + Collections.frequency(xs, 7));

        List<Integer> ro = Collections.unmodifiableList(xs);
        try { ro.add(1); } catch (UnsupportedOperationException e) { System.out.println("read-only"); }
        System.out.println(Collections.nCopies(3, "ab") + " " + Collections.emptyList());
    }
}
