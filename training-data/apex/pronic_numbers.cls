// Pronic numbers n(n+1)
public class PronicNumbers {
    public static Integer term(Integer n) {
        return n * (n + 1);
    }

    public static void run() {
        List<String> out = new List<String>();
        for (Integer n = 0; n < 10; n++) {
            out.add(String.valueOf(term(n)));
        }
        System.debug(String.join(out, ' '));
    }
}
