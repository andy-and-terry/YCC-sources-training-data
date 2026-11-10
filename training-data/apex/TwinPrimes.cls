public class TwinPrimes {
    public static void run() {
        List<Boolean> composite = new List<Boolean>();
        for (Integer i = 0; i <= 80; i++) composite.add(false);
        for (Integer i = 2; i * i <= 80; i++) {
            if (!composite[i]) for (Integer j = i * i; j <= 80; j += i) composite[j] = true;
        }
        List<String> pairs = new List<String>();
        for (Integer p = 3; p + 2 <= 80; p++) {
            if (!composite[p] && !composite[p + 2]) pairs.add('(' + p + ',' + (p + 2) + ')');
        }
        System.debug(String.join(pairs, ' ')); // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
    }
}
