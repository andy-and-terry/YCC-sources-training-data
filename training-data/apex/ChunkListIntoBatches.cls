public class ChunkListIntoBatches {
    public static List<List<Integer>> chunk(List<Integer> items, Integer size) {
        List<List<Integer>> batches = new List<List<Integer>>();
        List<Integer> current = new List<Integer>();
        for (Integer item : items) {
            current.add(item);
            if (current.size() == size) {
                batches.add(current);
                current = new List<Integer>();
            }
        }
        if (!current.isEmpty()) {
            batches.add(current);
        }
        return batches;
    }

    public static void main() {
        System.debug(chunk(new List<Integer>{ 1, 2, 3, 4, 5, 6, 7 }, 3));
    }
}
