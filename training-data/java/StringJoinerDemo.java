import java.util.StringJoiner;
import java.util.stream.Collectors;
import java.util.List;

public class StringJoinerDemo {
    public static void main(String[] args) {
        StringJoiner joiner = new StringJoiner(", ", "[", "]");
        joiner.setEmptyValue("EMPTY");
        System.out.println(joiner);

        joiner.add("red").add("green").add("blue");
        System.out.println(joiner + " length=" + joiner.length());

        StringJoiner other = new StringJoiner("|");
        other.add("x").add("y");
        joiner.merge(other);
        System.out.println(joiner);

        List<Integer> nums = List.of(1, 2, 3, 4);
        System.out.println(nums.stream().map(String::valueOf).collect(Collectors.joining("+", "(", ")")));
        System.out.println(String.join("/", "usr", "local", "bin"));
    }
}
