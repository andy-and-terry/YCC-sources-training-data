// Fibbinary numbers: no two adjacent 1 bits in the binary representation.
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class FibbinaryNumbers {
    public static void main(String[] args) {
        System.out.println(IntStream.range(0, 50)
                .filter(n -> (n & (n >> 1)) == 0)
                .mapToObj(Integer::toString)
                .collect(Collectors.joining(" ")));
    }
}
