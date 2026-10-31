public class SelfDescribingNumbers {
    static boolean isSelfDescribing(String s) {
        for (int i = 0; i < s.length(); i++) {
            final char digit = (char) ('0' + i);
            long count = s.chars().filter(c -> c == digit).count();
            if (count != s.charAt(i) - '0') return false;
        }
        return true;
    }

    public static void main(String[] args) {
        for (String s : new String[] {"1210", "2020", "21200", "1211"})
            System.out.println(s + " " + isSelfDescribing(s));
    }
}
