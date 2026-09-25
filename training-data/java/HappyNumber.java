import java.util.stream.IntStream;

public class HappyNumber {
    static int step(int n) {
        int s = 0;
        for (; n > 0; n /= 10) s += (n % 10) * (n % 10);
        return s;
    }

    static boolean isHappy(int n) {
        int slow = n, fast = step(n);
        while (fast != 1 && slow != fast) {
            slow = step(slow);
            fast = step(step(fast));
        }
        return fast == 1;
    }

    public static void main(String[] args) {
        IntStream.rangeClosed(1, 50).filter(HappyNumber::isHappy).forEach(n -> System.out.print(n + " "));
        System.out.println();
    }
}
