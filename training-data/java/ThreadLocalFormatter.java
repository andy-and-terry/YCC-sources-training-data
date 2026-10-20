import java.text.SimpleDateFormat;
import java.util.*;

public class ThreadLocalFormatter {
    static final ThreadLocal<SimpleDateFormat> FMT = ThreadLocal.withInitial(() -> {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd"); f.setTimeZone(TimeZone.getTimeZone("UTC")); return f; });

    public static void main(String[] args) throws Exception {
        Thread t = new Thread(() -> System.out.println(FMT.get().format(new Date(0))));
        t.start(); t.join();
        System.out.println(FMT.get().format(new Date(86400000L)));
    }
}
