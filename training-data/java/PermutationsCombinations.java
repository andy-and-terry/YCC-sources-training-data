import java.util.ArrayList;
import java.util.List;

public class PermutationsCombinations {
    public static List<List<Integer>> permutations(List<Integer> items) {
        List<List<Integer>> result = new ArrayList<>();
        if (items.size() <= 1) {
            result.add(items);
            return result;
        }
        for (int i = 0; i < items.size(); i++) {
            List<Integer> rest = new ArrayList<>(items);
            int chosen = rest.remove(i);
            for (List<Integer> perm : permutations(rest)) {
                List<Integer> withChosen = new ArrayList<>();
                withChosen.add(chosen);
                withChosen.addAll(perm);
                result.add(withChosen);
            }
        }
        return result;
    }

    public static List<List<Integer>> combinations(List<Integer> items, int r) {
        List<List<Integer>> result = new ArrayList<>();
        if (r == 0) {
            result.add(new ArrayList<>());
            return result;
        }
        if (items.size() < r) return result;
        int first = items.get(0);
        List<Integer> rest = items.subList(1, items.size());
        for (List<Integer> combo : combinations(rest, r - 1)) {
            List<Integer> withFirst = new ArrayList<>();
            withFirst.add(first);
            withFirst.addAll(combo);
            result.add(withFirst);
        }
        result.addAll(combinations(rest, r));
        return result;
    }

    public static void main(String[] args) {
        System.out.println(permutations(List.of(1, 2, 3)));
        System.out.println(combinations(List.of(1, 2, 3, 4), 2));
    }
}
