import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Map;

public class IdentityHashMapDemo {
    public static void main(String[] args) {
        String a = new String("key");
        String b = new String("key");

        Map<String, Integer> regular = new HashMap<>();
        regular.put(a, 1);
        regular.put(b, 2);

        Map<String, Integer> identity = new IdentityHashMap<>();
        identity.put(a, 1);
        identity.put(b, 2);

        System.out.println("HashMap size: " + regular.size());
        System.out.println("IdentityHashMap size: " + identity.size());
    }
}
