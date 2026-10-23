public class LookAndSay {
    static String next(String s) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < s.length(); ) {
            int j = i;
            while (j < s.length() && s.charAt(j) == s.charAt(i)) j++;
            sb.append(j - i).append(s.charAt(i));
            i = j;
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String s = "1";
        for (int i = 0; i < 7; i++) {
            System.out.println(s);
            s = next(s);
        }
    }
}
