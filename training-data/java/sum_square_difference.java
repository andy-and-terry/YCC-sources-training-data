// Square of the sum minus sum of squares for 1..10 (expect 2640)
import java.util.stream.IntStream;

public class SumSquareDifference {
    public static void main(String[] args) {
        int sum = IntStream.rangeClosed(1, 10).sum();
        int squares = IntStream.rangeClosed(1, 10).map(i -> i * i).sum();
        System.out.println(sum * sum - squares);
    }
}
