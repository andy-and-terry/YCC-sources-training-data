public class LazyCaterer {
    public static Integer pieces(Integer cuts) {
        return (cuts * cuts + cuts + 2) / 2;
    }

    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 0; n < 10; n++) out.add(pieces(n));
        System.debug(out); // (1, 2, 4, 7, 11, 16, 22, 29, 37, 46)
    }
}
