import java.util.concurrent.*;

public class ConcurrentHashMapMerge {
    public static void main(String[] args) throws Exception {
        ConcurrentHashMap<String, Integer> m = new ConcurrentHashMap<>();
        Thread[] ts = new Thread[4];
        for (int i = 0; i < 4; i++) { ts[i] = new Thread(() -> { for (int j = 0; j < 1000; j++) m.merge("k", 1, Integer::sum); }); ts[i].start(); }
        for (Thread t : ts) t.join();
        System.out.println(m.get("k"));
    }
}
