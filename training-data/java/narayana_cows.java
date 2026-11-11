// Narayana's cows N(n)=N(n-1)+N(n-3)
import java.util.Arrays;

public class NarayanaCows {
    public static void main(String[] args) {
        long[] v = new long[10];
        v[0] = 1; v[1] = 1; v[2] = 1;
        for (int i = 3; i < 10; i++) v[i] = v[i - 1] + v[i - 3];
        System.out.println(Arrays.toString(v));
    }
}
