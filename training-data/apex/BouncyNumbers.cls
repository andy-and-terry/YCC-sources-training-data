// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
public class BouncyNumbers {
    static Boolean isBouncy(Integer n) {
        List<String> d = String.valueOf(n).split('');
        Boolean inc = true;
        Boolean dec = true;
        for (Integer i = 1; i < d.size(); i++) {
            if (d[i - 1] > d[i]) inc = false;
            if (d[i - 1] < d[i]) dec = false;
        }
        return !inc && !dec;
    }

    public static void run() {
        Integer count = 0;
        for (Integer n = 1; n < 1000; n++) {
            if (isBouncy(n)) count++;
        }
        System.debug(count);
    }
}
