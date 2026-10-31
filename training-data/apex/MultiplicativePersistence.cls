public class MultiplicativePersistence {
    public static Integer persistence(Long n) {
        Integer steps = 0;
        while (n >= 10) {
            Long product = 1;
            while (n > 0) {
                product *= Math.mod(n, 10);
                n = n / 10;
            }
            n = product;
            steps++;
        }
        return steps;
    }

    public static void main() {
        for (Long n : new List<Long>{39, 77, 999, 10}) {
            System.debug(n + ' ' + persistence(n));
        }
    }
}
