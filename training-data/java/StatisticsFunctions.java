import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;

public class StatisticsFunctions {
    public static double mean(double[] values) {
        return Arrays.stream(values).average().orElse(0);
    }

    public static double median(double[] values) {
        double[] sorted = values.clone();
        Arrays.sort(sorted);
        int n = sorted.length;
        int mid = n / 2;
        return n % 2 == 0 ? (sorted[mid - 1] + sorted[mid]) / 2 : sorted[mid];
    }

    public static double mode(double[] values) {
        Map<Double, Long> counts = Arrays.stream(values).boxed()
            .collect(Collectors.groupingBy(v -> v, Collectors.counting()));
        return counts.entrySet().stream().max(Map.Entry.comparingByValue()).get().getKey();
    }

    public static double variance(double[] values) {
        double m = mean(values);
        return Arrays.stream(values).map(x -> (x - m) * (x - m)).average().orElse(0);
    }

    public static double stdev(double[] values) {
        return Math.sqrt(variance(values));
    }

    public static void main(String[] args) {
        double[] data = {2, 4, 4, 4, 5, 5, 7, 9};
        System.out.println(mean(data) + " " + median(data) + " " + mode(data) + " " + stdev(data));
    }
}
