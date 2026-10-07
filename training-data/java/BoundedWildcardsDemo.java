import java.util.ArrayList;
import java.util.List;

public class BoundedWildcardsDemo {
    // producer extends: safe to read Number out of src
    static double sumOf(List<? extends Number> src) {
        double total = 0;
        for (Number n : src) total += n.doubleValue();
        return total;
    }

    // consumer super: safe to write Integer into dest
    static void fillSquares(List<? super Integer> dest, int upTo) {
        for (int i = 1; i <= upTo; i++) dest.add(i * i);
    }

    static <T> void copy(List<? extends T> src, List<? super T> dest) {
        for (T item : src) dest.add(item);
    }

    public static void main(String[] args) {
        List<Integer> ints = List.of(1, 2, 3);
        List<Double> doubles = List.of(1.5, 2.5);

        System.out.println(sumOf(ints));
        System.out.println(sumOf(doubles));

        List<Number> numbers = new ArrayList<>();
        fillSquares(numbers, 5);
        System.out.println(numbers);

        List<Object> destination = new ArrayList<>();
        copy(ints, destination);
        System.out.println(destination);
    }
}
