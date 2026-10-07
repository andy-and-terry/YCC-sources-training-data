import java.util.HashSet;
import java.util.Set;

public class IsogramCheck {
    static boolean isIsogram(String s) {
        Set<Character> seen = new HashSet<>();
        for (char c : s.toLowerCase().toCharArray()) {
            if (Character.isLetter(c) && !seen.add(c)) return false;
        }
        return true;
    }

    public static void main(String[] args) {
        for (String w : new String[] {"lumberjacks", "background", "six-year-old", "isograms"}) {
            System.out.println(w + " " + isIsogram(w));
        }
    }
}
