import java.util.*;

public class GenericBoundedWildcards {
    static double sum(Collection<? extends Number> c) { double s = 0; for (Number n : c) s += n.doubleValue(); return s; }
    static void fill(List<? super Integer> l) { for (int i = 0; i < 3; i++) l.add(i); }
    static <T extends Comparable<T>> T max(List<T> l) { T m = l.get(0); for (T t : l) if (t.compareTo(m) > 0) m = t; return m; }

    public static void main(String[] args) {
        List<Number> nums = new ArrayList<>();
        fill(nums);
        System.out.println(sum(nums) + " " + max(List.of("a", "zz", "m")));
    }
}
