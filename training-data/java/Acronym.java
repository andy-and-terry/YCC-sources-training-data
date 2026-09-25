import java.util.Arrays;
import java.util.stream.Collectors;

public class Acronym {
    static String abbreviate(String phrase) {
        return Arrays.stream(phrase.split("[\\s\\-_]+"))
                .map(w -> w.replaceAll("[^A-Za-z]", ""))
                .filter(w -> !w.isEmpty())
                .map(w -> String.valueOf(Character.toUpperCase(w.charAt(0))))
                .collect(Collectors.joining());
    }

    public static void main(String[] args) {
        System.out.println(abbreviate("Portable Network Graphics"));
        System.out.println(abbreviate("Complementary metal-oxide semiconductor"));
    }
}
