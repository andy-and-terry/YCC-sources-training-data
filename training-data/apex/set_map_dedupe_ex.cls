public class SetMapDedupeEx {
    public static List<String> uniqueSorted(List<String> input) {
        Set<String> s = new Set<String>(input);
        List<String> out = new List<String>(s);
        out.sort();
        return out;
    }
}
