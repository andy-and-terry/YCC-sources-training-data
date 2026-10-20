import java.util.*;

public class CollectionsUtilityMethods {
    public static void main(String[] args) {
        List<Integer> l = new ArrayList<>(List.of(4, 1, 3, 2));
        Collections.sort(l);
        Collections.rotate(l, 1);
        System.out.println(l + " " + Collections.max(l) + " " + Collections.frequency(l, 3));
        Collections.swap(l, 0, 3);
        System.out.println(l + " " + Collections.unmodifiableList(l).getClass().getSimpleName().isEmpty());
        System.out.println(Collections.nCopies(3, "ab") + " " + Collections.emptyList());
    }
}
