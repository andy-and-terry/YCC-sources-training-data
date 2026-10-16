import java.util.LinkedHashMap;
import java.util.Map;

public class LinkedHashMapAccessOrder {
    public static void main(String[] args) {
        Map<String, Integer> map = new LinkedHashMap<>(16, 0.75f, true) {
            @Override
            protected boolean removeEldestEntry(Map.Entry<String, Integer> eldest) {
                return size() > 3;
            }
        };
        map.put("a", 1);
        map.put("b", 2);
        map.put("c", 3);
        map.get("a");
        map.put("d", 4);
        System.out.println(map.keySet());
    }
}
