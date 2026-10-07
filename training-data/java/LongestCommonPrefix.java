public class LongestCommonPrefix {
    public static String of(String... words) {
        if (words.length == 0) return "";
        String prefix = words[0];
        for (String w : words) {
            while (!w.startsWith(prefix)) prefix = prefix.substring(0, prefix.length() - 1);
            if (prefix.isEmpty()) break;
        }
        return prefix;
    }

    public static void main(String[] args) {
        System.out.println(of("flower", "flow", "flight"));
        System.out.println("[" + of("dog", "racecar", "car") + "]");
        System.out.println(of("interspecies", "interstellar", "interstate"));
    }
}
