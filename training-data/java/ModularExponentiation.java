public class ModularExponentiation {
    public static long modPow(long base, long exp, long mod) {
        long result = 1;
        base %= mod;
        while (exp > 0) {
            if ((exp & 1) == 1) result = (result * base) % mod;
            exp >>= 1;
            base = (base * base) % mod;
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(modPow(2, 10, 1_000_000_007));
        System.out.println(modPow(7, 128, 13));
    }
}
