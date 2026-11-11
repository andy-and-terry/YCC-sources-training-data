// Perrin sequence P(n)=P(n-2)+P(n-3)
import java.util.Arrays;

public class PerrinSequence {
    public static void main(String[] args) {
        long[] v = new long[10];
        v[0] = 3; v[1] = 0; v[2] = 2;
        for (int i = 3; i < 10; i++) v[i] = v[i - 2] + v[i - 3];
        System.out.println(Arrays.toString(v));
    }
}
