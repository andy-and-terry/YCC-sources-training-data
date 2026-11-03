public class PrimesBelowCount {
    public static Integer count(Integer n) {
        if (n < 3) return 0;
        List<Boolean> composite = new List<Boolean>();
        for (Integer i = 0; i < n; i++) composite.add(false);
        Integer total = 0;
        for (Integer i = 2; i < n; i++) {
            if (composite[i]) continue;
            total++;
            for (Integer j = i * i; j < n; j += i) composite[j] = true;
        }
        return total;
    }
}
