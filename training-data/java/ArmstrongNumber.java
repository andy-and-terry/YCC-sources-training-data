import java.util.stream.IntStream;

public class ArmstrongNumber {
    public static boolean isArmstrong(int n) {
        String digits = Integer.toString(n);
        int k = digits.length();
        long sum = 0;
        for (char c : digits.toCharArray()) sum += (long) Math.pow(c - '0', k);
        return sum == n;
    }

    public static void main(String[] args) {
        System.out.println(IntStream.range(1, 1_000_000).filter(ArmstrongNumber::isArmstrong).boxed().toList());
    }
}
