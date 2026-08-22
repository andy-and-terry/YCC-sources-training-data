import java.util.ArrayList;
import java.util.List;

public class PowerSet {
    public static List<List<Integer>> powerSet(List<Integer> items) {
        List<List<Integer>> result = new ArrayList<>();
        result.add(new ArrayList<>());
        for (int item : items) {
            int size = result.size();
            for (int i = 0; i < size; i++) {
                List<Integer> newSubset = new ArrayList<>(result.get(i));
                newSubset.add(item);
                result.add(newSubset);
            }
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(powerSet(List.of(1, 2, 3)));
    }
}
