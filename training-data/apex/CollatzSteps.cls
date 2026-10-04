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
        for (Integer i = 1; i <= 10; i++) {
            System.debug(i + ' -> ' + steps(i) + ' steps');
        }
    }
}
