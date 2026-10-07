public class PermutationGenerator {
    public static List<List<Integer>> permute(List<Integer> items) {
        List<List<Integer>> result = new List<List<Integer>>();
        backtrack(items, 0, result);
        return result;
    }

    private static void backtrack(List<Integer> items, Integer start, List<List<Integer>> result) {
        if (start == items.size()) {
            result.add(items.clone());
            return;
        }
        for (Integer i = start; i < items.size(); i++) {
            swap(items, start, i);
            backtrack(items, start + 1, result);
            swap(items, start, i);
        }
    }

    private static void swap(List<Integer> items, Integer i, Integer j) {
        Integer tmp = items[i];
        items[i] = items[j];
        items[j] = tmp;
    }

    public static void run() {
        System.debug(permute(new List<Integer>{1, 2, 3}));
    }
}
