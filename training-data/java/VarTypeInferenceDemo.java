import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class VarTypeInferenceDemo {
    public static void main(String[] args) {
        var count = 10;
        var label = "items";
        System.out.println(count + " " + label);

        var numbers = new ArrayList<Integer>();
        for (var i = 1; i <= 5; i++) {
            numbers.add(i * i);
        }
        System.out.println(numbers);

        var totals = new TreeMap<String, Integer>();
        totals.put("apples", 3);
        totals.put("bananas", 7);
        for (var entry : totals.entrySet()) {
            System.out.println(entry.getKey() + " -> " + entry.getValue());
        }

        List<Map.Entry<String, Integer>> entries = new ArrayList<>(totals.entrySet());
        var first = entries.get(0);
        System.out.println(first.getKey());
    }
}
