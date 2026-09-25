public class CountAndSay {
    public static String term(int n) {
        String s = "1";
        for (int k = 1; k < n; k++) {
            StringBuilder next = new StringBuilder();
            for (int i = 0; i < s.length(); ) {
                int j = i;
                while (j < s.length() && s.charAt(j) == s.charAt(i)) j++;
                next.append(j - i).append(s.charAt(i));
                i = j;
            }
            s = next.toString();
        }
        return s;
    }

    public static void main(String[] args) {
        for (int i = 1; i <= 10; i++) System.out.println(i + " " + term(i));
    }
}
