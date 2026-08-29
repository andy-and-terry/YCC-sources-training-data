public class FizzBuzz {
    public static String fizzbuzz(Integer n) {
        if (Math.mod(n, 15) == 0) return 'FizzBuzz';
        if (Math.mod(n, 3) == 0) return 'Fizz';
        if (Math.mod(n, 5) == 0) return 'Buzz';
        return String.valueOf(n);
    }

    public static void main() {
        for (Integer i = 1; i <= 20; i++) {
            System.debug(fizzbuzz(i));
        }
    }
}
