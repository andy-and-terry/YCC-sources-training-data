import java.util.*;

public class GenericBoundedWildcard {
    static double sum(Collection<? extends Number> c) {
        double s = 0;
        for (Number n : c) s += n.doubleValue();
        return s;
    }

    static void fill(List<? super Integer> l) { for (int i = 0; i < 3; i++) l.add(i); }

    public static void main(String[] args) {
        List<Number> l = new ArrayList<>();
        fill(l);
        System.out.println(sum(l));
    }
}
