import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class FlatMapStreamDemo {
    public static void main(String[] args) {
        List<List<Integer>> nested = List.of(List.of(1, 2), List.of(3), List.of(), List.of(4, 5, 6));
        List<Integer> flat = nested.stream().flatMap(List::stream).collect(Collectors.toList());
        System.out.println(flat);

        List<String> sentences = List.of("the quick brown", "fox jumps", "over");
        List<String> words = sentences.stream()
                .flatMap(s -> Stream.of(s.split(" ")))
                .map(String::toUpperCase)
                .toList();
        System.out.println(words);

        long chars = sentences.stream().flatMapToInt(String::chars).filter(Character::isLetter).count();
        System.out.println("letters: " + chars);
    }
}
