public class TwinPrimes {
    public static void main(String[] args) {
        int limit = 80;
        boolean[] composite = new boolean[limit + 1];
        for (int i = 2; i * i <= limit; i++)
            if (!composite[i])
                for (int j = i * i; j <= limit; j += i) composite[j] = true;
        StringBuilder sb = new StringBuilder();
        for (int p = 3; p + 2 <= limit; p++)
            if (!composite[p] && !composite[p + 2]) sb.append("(").append(p).append(",").append(p + 2).append(") ");
        System.out.println(sb.toString().trim()); // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
    }
}
