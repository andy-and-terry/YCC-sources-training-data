public class LychrelSteps {
    // Reverse-and-add until a palindrome; count the steps.
    public static Long reverseDigits(Long n) {
        Long r = 0;
        while (n > 0) {
            r = r * 10 + Math.mod(n, 10);
            n = n / 10;
        }
        return r;
    }

    public static Integer steps(Long start) {
        Long n = start;
        for (Integer count = 0; count < 50; count++) {
            if (count > 0 && n == reverseDigits(n)) return count;
            n += reverseDigits(n);
        }
        return -1;
    }

    public static String sample() {
        List<String> out = new List<String>();
        for (Long s : new List<Long>{ 56, 57, 59, 79, 89 }) {
            out.add(String.valueOf(steps(s)));
        }
        return String.join(out, ' ');
    }
}
