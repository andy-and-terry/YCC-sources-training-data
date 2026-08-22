import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class BucketSort {
    public static List<Double> bucketSort(List<Double> items, int bucketCount) {
        if (items.isEmpty()) return items;
        double lo = Collections.min(items);
        double hi = Collections.max(items);
        double span = (hi - lo == 0) ? 1 : hi - lo;
        List<List<Double>> buckets = new ArrayList<>();
        for (int i = 0; i < bucketCount; i++) buckets.add(new ArrayList<>());
        for (double x : items) {
            int idx = Math.min(bucketCount - 1, (int) ((x - lo) / span * bucketCount));
            buckets.get(idx).add(x);
        }
        List<Double> result = new ArrayList<>();
        for (List<Double> bucket : buckets) {
            Collections.sort(bucket);
            result.addAll(bucket);
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(bucketSort(Arrays.asList(0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51), 10));
    }
}
