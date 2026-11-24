// Fibbinary numbers: no two adjacent 1 bits (checked by scanning the bits).
public class FibbinaryNumbers {
    public static Boolean isFibbinary(Integer n) {
        Integer prev = 0;
        while (n > 0) {
            Integer bit = Math.mod(n, 2);
            if (bit == 1 && prev == 1) return false;
            prev = bit;
            n = n / 2;
        }
        return true;
    }

    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 0; n < 50; n++) if (isFibbinary(n)) out.add(n);
        System.debug(String.join(out, ' '));
    }
}
