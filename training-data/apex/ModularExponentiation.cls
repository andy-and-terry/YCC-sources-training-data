public class ModularExponentiation {
    public static Long power(Long base, Long exponent, Long modulus) {
        Long result = 1L;
        Long b = Math.mod(base, modulus);
        Long e = exponent;
        while (e > 0) {
            if (Math.mod(e, 2L) == 1L) {
                result = Math.mod(result * b, modulus);
            }
            e = e / 2;
            b = Math.mod(b * b, modulus);
        }
        return result;
    }

    public static void main() {
        System.debug(power(2L, 10L, 1000L));
        System.debug(power(7L, 128L, 13L));
    }
}
