// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
public class MunchausenNumbers {
    static Boolean isMunchausen(Integer n) {
        Integer total = 0;
        for (String c : String.valueOf(n).split('')) {
            Integer d = Integer.valueOf(c);
            if (d > 0) total += (Integer) Math.pow(d, d);
        }
        return total == n;
    }

    public static void run() {
        List<String> out = new List<String>();
        for (Integer n = 1; n < 5000; n++) {
            if (isMunchausen(n)) out.add(String.valueOf(n));
        }
        System.debug(String.join(out, ' '));
    }
}
