import java.util.stream.IntStream;

public class HappyNumber {
    private static int next(int n) {
        int sum = 0;
        for (; n > 0; n /= 10) sum += (n % 10) * (n % 10);
        return sum;
    }

    public static boolean isHappy(int n) {
        int slow = n, fast = next(n);
        while (fast != 1 && slow != fast) {
            slow = next(slow);
            fast = next(next(fast));
        }
        return fast == 1;
    }

    public static void main(String[] args) {
        System.out.println(IntStream.rangeClosed(1, 50).filter(HappyNumber::isHappy).boxed().toList());
    }
}
