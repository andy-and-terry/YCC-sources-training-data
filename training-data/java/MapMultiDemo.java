import java.util.List;
import java.util.stream.Stream;

public class MapMultiDemo {
    public static void main(String[] args) {
        List<Integer> expanded = Stream.of(1, 2, 3)
            .<Integer>mapMulti((n, sink) -> {
                for (int i = 0; i < n; i++) sink.accept(n);
            })
            .toList();
        System.out.println(expanded);

        List<String> evensOnly = Stream.of(1, 2, 3, 4, 5, 6)
            .<String>mapMulti((n, sink) -> {
                if (n % 2 == 0) sink.accept("even-" + n);
            })
            .toList();
        System.out.println(evensOnly);
    }
}
