public class BucketSort {
    public static List<Double> sort(List<Double> input) {
        Integer bucketCount = input.size();
        List<List<Double>> buckets = new List<List<Double>>();
        for (Integer i = 0; i < bucketCount; i++) {
            buckets.add(new List<Double>());
        }

        for (Double value : input) {
            Integer idx = (Integer) Math.floor(value * bucketCount);
            if (idx >= bucketCount) {
                idx = bucketCount - 1;
            }
            buckets[idx].add(value);
        }

        List<Double> result = new List<Double>();
        for (List<Double> bucket : buckets) {
            bucket.sort();
            result.addAll(bucket);
        }
        return result;
    }

    public static void main() {
        List<Double> data = new List<Double>{0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21};
        System.debug(sort(data));
    }
}
