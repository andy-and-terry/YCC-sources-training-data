public class TwinPrimes {
    public static List<String> upTo(Integer n) {
        List<Boolean> composite = new List<Boolean>();
        for (Integer i = 0; i <= n; i++) {
            composite.add(false);
        }
        for (Integer i = 2; i * i <= n; i++) {
            if (!composite[i]) {
                for (Integer j = i * i; j <= n; j += i) {
                    composite[j] = true;
                }
            }
        }
        List<String> pairs = new List<String>();
        for (Integer p = 3; p + 2 <= n; p++) {
            if (!composite[p] && !composite[p + 2]) {
                pairs.add('(' + p + ', ' + (p + 2) + ')');
            }
        }
        return pairs;
    }

    public static void demo() {
        System.debug(upTo(50));
    }
}
