import java.util.Arrays;

public class PrimesBelowCount {
    static int countPrimesBelow(int n) {
        if (n < 3) return 0;
        boolean[] composite = new boolean[n];
        int count = 0;
        for (int i = 2; i < n; i++) {
            if (composite[i]) continue;
            count++;
            for (long j = (long) i * i; j < n; j += i) composite[(int) j] = true;
        }
        return count;
    }

    public static void main(String[] args) {
        System.out.println(countPrimesBelow(100));
    }
}
