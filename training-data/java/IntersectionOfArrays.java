import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;

public class IntersectionOfArrays {
    public static Set<Integer> unique(int[] a, int[] b) {
        Set<Integer> sb = Arrays.stream(b).boxed().collect(Collectors.toSet());
        return Arrays.stream(a).filter(sb::contains).boxed().collect(Collectors.toCollection(TreeSet::new));
    }

    public static List<Integer> withMultiplicity(int[] a, int[] b) {
        Map<Integer, Integer> counts = new HashMap<>();
        for (int x : a) counts.merge(x, 1, Integer::sum);
        List<Integer> out = new ArrayList<>();
        for (int x : b) {
            if (counts.getOrDefault(x, 0) > 0) {
                out.add(x);
                counts.merge(x, -1, Integer::sum);
            }
        }
        return out;
    }

    public static void main(String[] args) {
        int[] x = {4, 9, 5, 4, 4}, y = {9, 4, 9, 8, 4};
        System.out.println(unique(x, y) + " " + withMultiplicity(x, y));
    }
}
