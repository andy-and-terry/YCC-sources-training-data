public class ArmstrongNumbers {
    public static Boolean isArmstrong(Integer n) {
        String s = String.valueOf(n);
        Integer total = 0;
        for (Integer i = 0; i < s.length(); i++) {
            Integer d = Integer.valueOf(s.substring(i, i + 1));
            total += (Integer) Math.pow(d, s.length());
        }
        return total == n;
    }

    public static List<Integer> upTo(Integer limit) {
        List<Integer> result = new List<Integer>();
        for (Integer n = 1; n <= limit; n++) {
            if (isArmstrong(n)) result.add(n);
        }
        return result; // upTo(999): 1..9, 153, 370, 371, 407
    }
}
