// Bulls and Cows scoring for equal-length digit strings.
public class BullsAndCows {
    public class Score {
        public Integer bulls = 0;
        public Integer cows = 0;
    }

    public static Score score(String secret, String guess) {
        Score result = new Score();
        Map<String, Integer> sc = new Map<String, Integer>();
        Map<String, Integer> gc = new Map<String, Integer>();
        for (Integer i = 0; i < secret.length(); i++) {
            String s = secret.substring(i, i + 1);
            String g = guess.substring(i, i + 1);
            if (s == g) {
                result.bulls++;
            } else {
                sc.put(s, (sc.containsKey(s) ? sc.get(s) : 0) + 1);
                gc.put(g, (gc.containsKey(g) ? gc.get(g) : 0) + 1);
            }
        }
        for (String c : sc.keySet()) {
            result.cows += Math.min(sc.get(c), gc.containsKey(c) ? gc.get(c) : 0);
        }
        return result;
    }

    public static void run() {
        Score r = score('1807', '7810');
        System.debug(r.bulls + ' bull(s), ' + r.cows + ' cow(s)');
    }
}
