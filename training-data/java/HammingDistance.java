import java.util.stream.IntStream;

public class HammingDistance {
    static long distance(String a, String b) {
        if (a.length() != b.length()) throw new IllegalArgumentException("strands must be of equal length");
        return IntStream.range(0, a.length()).filter(i -> a.charAt(i) != b.charAt(i)).count();
    }

    public static void main(String[] args) {
        System.out.println(distance("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"));
    }
}
