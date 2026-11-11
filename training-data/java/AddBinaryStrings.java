public class AddBinaryStrings {
    static String addBinary(String a, String b) {
        StringBuilder out = new StringBuilder();
        int i = a.length() - 1, j = b.length() - 1, carry = 0;
        while (i >= 0 || j >= 0 || carry > 0) {
            int sum = carry;
            if (i >= 0) sum += a.charAt(i--) - '0';
            if (j >= 0) sum += b.charAt(j--) - '0';
            out.append(sum % 2);
            carry = sum / 2;
        }
        return out.reverse().toString();
    }

    public static void main(String[] args) {
        System.out.println(addBinary("1010", "1011")); // 10101
    }
}
