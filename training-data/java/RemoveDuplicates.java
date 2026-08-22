import java.util.LinkedHashSet;
import java.util.List;

public class RemoveDuplicates {
    public static List<Integer> removeDuplicatesOrdered(List<Integer> items) {
        return new java.util.ArrayList<>(new LinkedHashSet<>(items));
    }

    public static void main(String[] args) {
        System.out.println(removeDuplicatesOrdered(List.of(1, 2, 2, 3, 1, 4)));
    }
}
