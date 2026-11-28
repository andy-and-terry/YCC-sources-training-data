public class Dedupe {
    public static List<String> unique(List<String> input) {
        Set<String> seen = new Set<String>();
        List<String> out = new List<String>();
        for (String s : input) {
            if (seen.add(s.toLowerCase())) out.add(s);
        }
        return out;
    }
}
