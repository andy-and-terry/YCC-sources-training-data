// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
public class KeithNumbers {
    static Boolean isKeith(Integer n) {
        List<Integer> seq = new List<Integer>();
        for (String c : String.valueOf(n).split('')) seq.add(Integer.valueOf(c));
        Integer k = seq.size();
        while (seq[seq.size() - 1] < n) {
            Integer total = 0;
            for (Integer i = seq.size() - k; i < seq.size(); i++) total += seq[i];
            seq.add(total);
        }
        return seq[seq.size() - 1] == n;
    }

    public static void run() {
        List<String> out = new List<String>();
        for (Integer n = 10; n < 1200; n++) {
            if (isKeith(n)) out.add(String.valueOf(n));
        }
        System.debug(String.join(out, ' '));
    }
}
