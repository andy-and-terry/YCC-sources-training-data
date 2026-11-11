// Repunits: numbers made only of the digit 1.
public class RepunitNumbers {
    public static List<Long> repunits(Integer count) {
        List<Long> out = new List<Long>();
        Long r = 0;
        for (Integer i = 0; i < count; i++) {
            r = r * 10 + 1;
            out.add(r);
        }
        return out;
    }

    public static void run() {
        System.debug(repunits(5));
    }
}
