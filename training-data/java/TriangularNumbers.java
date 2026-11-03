import java.util.stream.IntStream;

public class TriangularNumbers {
    public static void main(String[] args) {
        IntStream.rangeClosed(1, 10)
            .map(n -> n * (n + 1) / 2)
            .forEach(t -> System.out.print(t + " "));
        System.out.println();
    }
}
