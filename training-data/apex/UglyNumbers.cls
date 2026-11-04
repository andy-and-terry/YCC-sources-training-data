public class UglyNumbers {
    public static Long ugly(Integer n) {
        List<Long> seq = new List<Long>{1L};
        Integer i2 = 0, i3 = 0, i5 = 0;
        while (seq.size() < n) {
            Long c2 = seq[i2] * 2, c3 = seq[i3] * 3, c5 = seq[i5] * 5;
            Long next = Math.min(c2, Math.min(c3, c5));
            seq.add(next);
            if (next == c2) i2++;
            if (next == c3) i3++;
            if (next == c5) i5++;
        }
        return seq[n - 1];
    }
}
