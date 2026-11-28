public class SternDiatomic {
    public static List<Integer> sequence(Integer count) {
        List<Integer> seq = new List<Integer>{ 0, 1 };
        for (Integer i = 2; i < count; i++) {
            Integer h = i / 2;
            if (Math.mod(i, 2) == 0) {
                seq.add(seq[h]);
            } else {
                seq.add(seq[h] + seq[h + 1]);
            }
        }
        return seq; // sequence(15): 0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3
    }
}
