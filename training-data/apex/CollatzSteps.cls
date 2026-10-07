public class CollatzSteps {
    public static Integer steps(Long n) {
        Integer count = 0;
        while (n != 1) {
            if (Math.mod(n, 2) == 0) {
                n = n / 2;
            } else {
                n = 3 * n + 1;
            }
            count++;
        }
        return count;
    }

    public static void main() {
        for (Long n : new List<Long>{ 1, 6, 7, 27 }) {
            System.debug('collatz(' + n + ') = ' + steps(n));
        }
    }
}
