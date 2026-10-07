import java.util.stream.Collectors;

public class Rot13 {
    public static String rot(String s, int n) {
        int k = Math.floorMod(n, 26);
        return s.chars().map(c -> {
            if (c >= 'a' && c <= 'z') return 'a' + (c - 'a' + k) % 26;
            if (c >= 'A' && c <= 'Z') return 'A' + (c - 'A' + k) % 26;
            return c;
        }).mapToObj(c -> String.valueOf((char) c)).collect(Collectors.joining());
    }

    public static void main(String[] args) {
        String text = "Why did the chicken cross the road?";
        String r = rot(text, 13);
        System.out.println(r);
        System.out.println(rot(r, 13).equals(text) + " " + rot(rot(text, 5), -5).equals(text));
    }
}
