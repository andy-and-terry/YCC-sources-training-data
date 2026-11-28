import java.util.HashSet;
import java.util.Set;

public class HappyNumbers {
    static boolean isHappy(int n) {
        Set<Integer> seen = new HashSet<>();
        while (n != 1 && seen.add(n)) {
            int s = 0;
            for (; n > 0; n /= 10) s += (n % 10) * (n % 10);
            n = s;
        }
        return n == 1;
    }

    public static void main(String[] args) {
        for (int n = 1, c = 0; c < 8; n++) {
            if (isHappy(n)) { System.out.print(n + " "); c++; }
        }
        System.out.println(); // 1 7 10 13 19 23 28 31
    }
}
