import java.util.DoubleSummaryStatistics;
import java.util.IntSummaryStatistics;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class SummaryStatisticsDemo {
    public static void main(String[] args) {
        IntSummaryStatistics stats = IntStream.of(4, 8, 15, 16, 23, 42).summaryStatistics();
        System.out.println("count=" + stats.getCount());
        System.out.println("sum=" + stats.getSum());
        System.out.println("min=" + stats.getMin() + " max=" + stats.getMax());
        System.out.printf("avg=%.2f%n", stats.getAverage());

        List<String> words = List.of("alpha", "be", "gamma", "pi");
        DoubleSummaryStatistics lengths = words.stream()
            .collect(Collectors.summarizingDouble(String::length));
        System.out.println(lengths);

        IntSummaryStatistics merged = new IntSummaryStatistics();
        IntStream.rangeClosed(1, 5).forEach(merged::accept);
        merged.combine(stats);
        System.out.println(merged.getCount() + " " + merged.getSum());
    }
}
