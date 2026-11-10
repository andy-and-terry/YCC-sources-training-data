import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class LazyCaterer {
    static int pieces(int cuts) {
        return (cuts * cuts + cuts + 2) / 2;
    }

    public static void main(String[] args) {
        System.out.println(IntStream.range(0, 10).map(LazyCaterer::pieces)
                .mapToObj(Integer::toString).collect(Collectors.joining(" "))); // 1 2 4 7 11 16 22 29 37 46
    }
}
