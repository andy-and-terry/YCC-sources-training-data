public class BigIntegerAddition {
    public static String add(String a, String b) {
        StringBuilder sb = new StringBuilder();
        int i = a.length() - 1, j = b.length() - 1, carry = 0;
        while (i >= 0 || j >= 0 || carry > 0) {
            int s = carry + (i >= 0 ? a.charAt(i--) - '0' : 0) + (j >= 0 ? b.charAt(j--) - '0' : 0);
            sb.append((char) ('0' + s % 10));
            carry = s / 10;
        }
        return sb.reverse().toString();
    }

    public static String multiply(String a, String b) {
        int[] res = new int[a.length() + b.length()];
        for (int i = a.length() - 1; i >= 0; i--) {
            for (int j = b.length() - 1; j >= 0; j--) {
                int p = (a.charAt(i) - '0') * (b.charAt(j) - '0') + res[i + j + 1];
                res[i + j + 1] = p % 10;
                res[i + j] += p / 10;
            }
        }
        StringBuilder sb = new StringBuilder();
        for (int d : res) if (!(sb.length() == 0 && d == 0)) sb.append(d);
        return sb.length() == 0 ? "0" : sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(add("99999999999999999999", "1"));
        String f = "1";
        for (int i = 2; i <= 25; i++) f = multiply(f, Integer.toString(i));
        System.out.println("25! = " + f);
        System.out.println(multiply("123456789", "987654321") + " == " + (123456789L * 987654321L));
    }
}
