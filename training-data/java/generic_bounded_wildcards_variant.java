import java.util.ArrayList;
import java.util.List;

public class WildcardDemo {
    static double sum(List<? extends Number> xs) {
        double t = 0;
        for (Number n : xs) t += n.doubleValue();
        return t;
    }

    static void fill(List<? super Integer> out) {
        for (int i = 0; i < 3; i++) out.add(i);
    }

    public static void main(String[] args) {
        List<Number> l = new ArrayList<>();
        fill(l);
        System.out.println(sum(l));
    }
}
