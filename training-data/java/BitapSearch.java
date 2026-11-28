public class BitapSearch {
    static int bitap(String text, String pat) {
        long[] masks = new long[65536];
        for (int i = 0; i < pat.length(); i++) masks[pat.charAt(i)] |= 1L << i;
        long state = 0, goal = 1L << (pat.length() - 1);
        for (int i = 0; i < text.length(); i++) {
            state = ((state << 1) | 1) & masks[text.charAt(i)];
            if ((state & goal) != 0) return i - pat.length() + 1;
        }
        return -1;
    }

    public static void main(String[] args) {
        System.out.println(bitap("the quick brown fox", "brown"));
    }
}
