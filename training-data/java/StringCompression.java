public class StringCompression {
    public static String compress(String s) {
        if (s.isEmpty()) return s;
        StringBuilder sb = new StringBuilder();
        int count = 1;
        for (int i = 1; i <= s.length(); i++) {
            if (i < s.length() && s.charAt(i) == s.charAt(i - 1)) {
                count++;
            } else {
                sb.append(s.charAt(i - 1)).append(count);
                count = 1;
            }
        }
        return sb.length() < s.length() ? sb.toString() : s;
    }

    public static String decompress(String s) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < s.length(); ) {
            char c = s.charAt(i++);
            int start = i;
            while (i < s.length() && Character.isDigit(s.charAt(i))) i++;
            sb.append(String.valueOf(c).repeat(Integer.parseInt(s.substring(start, i))));
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        for (String w : new String[] {"aabcccccaaa", "abc", "zzzzzzzzzz"}) {
            String c = compress(w);
            System.out.println(w + " -> " + c + (c.equals(w) ? "" : " -> " + decompress(c)));
        }
    }
}
