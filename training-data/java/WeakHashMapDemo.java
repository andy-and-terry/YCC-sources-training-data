import java.util.Map;
import java.util.WeakHashMap;

public class WeakHashMapDemo {
    public static void main(String[] args) throws InterruptedException {
        Map<Object, String> cache = new WeakHashMap<>();
        Object keep = new Object();
        Object drop = new Object();
        cache.put(keep, "kept");
        cache.put(drop, "dropped");
        System.out.println("before: " + cache.size());

        drop = null;
        for (int i = 0; i < 5 && cache.size() > 1; i++) {
            System.gc();
            Thread.sleep(50);
        }
        System.out.println("strong key still present: " + cache.containsKey(keep));
    }
}
