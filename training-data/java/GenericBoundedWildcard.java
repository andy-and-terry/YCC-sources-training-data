import java.util.*;

public class GenericBoundedWildcard {
    static double sum(Collection<? extends Number> nums) {
        double total = 0;
        for (Number n : nums) total += n.doubleValue();
        return total;
    }

    static void fill(List<? super Integer> sink) {
        for (int i = 0; i < 3; i++) sink.add(i);
    }

    public static void main(String[] args) {
        List<Number> sink = new ArrayList<>();
        fill(sink);
        System.out.println(sum(sink) + sum(List.of(1.5, 2.5)));
    }
}
