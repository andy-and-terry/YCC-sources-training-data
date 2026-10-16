public class MultiplyStrings {
    static String multiply(String a, String b) {
        if (a.equals("0") || b.equals("0")) return "0";
        int[] res = new int[a.length() + b.length()];
        for (int i = a.length() - 1; i >= 0; i--) {
            for (int j = b.length() - 1; j >= 0; j--) {
                int prod = (a.charAt(i) - '0') * (b.charAt(j) - '0') + res[i + j + 1];
                res[i + j + 1] = prod % 10;
                res[i + j] += prod / 10;
            }
        }
        StringBuilder sb = new StringBuilder();
        for (int d : res) {
            if (sb.length() == 0 && d == 0) continue;
            sb.append(d);
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(multiply("123", "456"));
        System.out.println(multiply("99999999999", "99999999999"));
    }
}
