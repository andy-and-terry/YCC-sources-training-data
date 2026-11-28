import java.math.BigInteger;

public class PalindromicPrimes {
    static boolean isPalindrome(int n) {
        String s = Integer.toString(n);
        return new StringBuilder(s).reverse().toString().equals(s);
    }

    public static void main(String[] args) {
        for (int n = 2; n < 200; n++) {
            if (isPalindrome(n) && BigInteger.valueOf(n).isProbablePrime(20)) System.out.print(n + " ");
        }
        System.out.println(); // 2 3 5 7 11 101 131 151 181 191
    }
}
