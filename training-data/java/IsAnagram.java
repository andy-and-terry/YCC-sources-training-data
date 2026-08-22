import java.util.Arrays;

public class IsAnagram {
    public static boolean isAnagram(String a, String b) {
        char[] ca = a.replace(" ", "").toLowerCase().toCharArray();
        char[] cb = b.replace(" ", "").toLowerCase().toCharArray();
        Arrays.sort(ca);
        Arrays.sort(cb);
        return Arrays.equals(ca, cb);
    }

    public static void main(String[] args) {
        System.out.println(isAnagram("listen", "silent"));
        System.out.println(isAnagram("hello", "world"));
    }
}
