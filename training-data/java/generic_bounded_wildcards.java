import java.util.*;

public class GenericBoundedWildcards {
    static double sum(List<? extends Number> xs) {
        double t = 0;
        for (Number n : xs) t += n.doubleValue();
        return t;
    }
    static void fill(List<? super Integer> xs) {
        for (int i = 0; i < 3; i++) xs.add(i);
    }
    public static void main(String[] args) {
        List<Number> l = new ArrayList<>();
        fill(l);
        System.out.println(sum(l));
    }
}
