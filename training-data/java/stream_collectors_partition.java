import java.util.List;
import java.util.stream.Collectors;

public class StreamPartition {
    public static void main(String[] args) {
        var m = List.of(1, 2, 3, 4, 5, 6).stream()
            .collect(Collectors.partitioningBy(n -> n % 2 == 0, Collectors.counting()));
        System.out.println(m);
    }
}
