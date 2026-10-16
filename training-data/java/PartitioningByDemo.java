import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class PartitioningByDemo {
    public static void main(String[] args) {
        List<Integer> nums = IntStream.rangeClosed(1, 10).boxed().toList();
        Map<Boolean, List<Integer>> parts = nums.stream()
                .collect(Collectors.partitioningBy(n -> n % 2 == 0));
        System.out.println("even: " + parts.get(true));
        System.out.println("odd:  " + parts.get(false));

        Map<Boolean, Long> counts = nums.stream()
                .collect(Collectors.partitioningBy(n -> n > 7, Collectors.counting()));
        System.out.println(counts);
    }
}
