import java.util.Map;
import java.util.TreeMap;

public class VowelCounter {
    static Map<Character, Integer> countVowels(String s) {
        Map<Character, Integer> result = new TreeMap<>();
        for (char c : s.toLowerCase().toCharArray()) {
            if ("aeiou".indexOf(c) >= 0) result.merge(c, 1, Integer::sum);
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(countVowels("Education is beautiful"));
    }
}
