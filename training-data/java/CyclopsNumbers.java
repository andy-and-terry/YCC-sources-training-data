// Cyclops numbers: odd digit count, middle digit zero, no other zeros.
// Count those in 1..99999 (expected 6642).
public class CyclopsNumbers {
    static boolean isCyclops(int n) {
        String s = String.valueOf(n);
        return s.length() % 2 == 1
            && s.charAt(s.length() / 2) == '0'
            && s.chars().filter(c -> c == '0').count() == 1;
    }

    public static void main(String[] args) {
        int count = 0;
        for (int n = 1; n < 100000; n++) if (isCyclops(n)) count++;
        System.out.println(count);
    }
}
