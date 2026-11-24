// Moser-de Bruijn sequence: binary digits of n read in base 4.
public class MoserDeBruijn {
    public static Integer moser(Integer n) {
        Integer result = 0;
        Integer place = 1;
        while (n > 0) {
            if (Math.mod(n, 2) == 1) result += place;
            n = n / 2;
            place *= 4;
        }
        return result;
    }

    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 0; n < 12; n++) out.add(moser(n));
        System.debug(String.join(out, ' '));
    }
}
