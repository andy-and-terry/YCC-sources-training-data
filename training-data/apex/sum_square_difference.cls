// Square of the sum minus sum of squares for 1..10 (expect 2640)
public class SumSquareDifference {
    public static Integer diff(Integer n) {
        Integer sum = 0;
        Integer squares = 0;
        for (Integer i = 1; i <= n; i++) {
            sum += i;
            squares += i * i;
        }
        return sum * sum - squares;
    }

    public static void run() {
        System.debug(diff(10));
    }
}
