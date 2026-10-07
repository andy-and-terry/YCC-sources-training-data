import java.util.List;
import java.util.StringJoiner;
import java.util.stream.Collectors;

public class StringJoinerDemo {
    public static void main(String[] args) {
        StringJoiner sj = new StringJoiner(", ", "[", "]");
        sj.setEmptyValue("EMPTY");
        System.out.println(sj);
        sj.add("a").add("b").add("c");
        System.out.println(sj);

        System.out.println(String.join("-", List.of("x", "y", "z")));
        System.out.println(List.of(1, 2, 3).stream()
            .map(String::valueOf)
            .collect(Collectors.joining("+", "(", ")")));
    }
}
