public class InterleaveStrings {
    static String interleave(String... parts) {
        int longest = 0;
        for (String p : parts) longest = Math.max(longest, p.length());
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < longest; i++)
            for (String p : parts)
                if (i < p.length()) sb.append(p.charAt(i));
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(interleave("abc", "12345"));
        System.out.println(interleave("ab", "cd", "efg"));
    }
}
