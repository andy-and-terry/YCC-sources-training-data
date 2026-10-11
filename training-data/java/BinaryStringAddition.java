public class BinaryStringAddition {
    static String add(String a, String b) {
        StringBuilder sb = new StringBuilder();
        int i = a.length() - 1, j = b.length() - 1, carry = 0;
        while (i >= 0 || j >= 0 || carry > 0) {
            int sum = carry;
            if (i >= 0) sum += a.charAt(i--) - '0';
            if (j >= 0) sum += b.charAt(j--) - '0';
            sb.append(sum & 1);
            carry = sum >> 1;
        }
        return sb.reverse().toString();
    }

    public static void main(String[] args) {
        System.out.println(add("1010", "1011"));
        System.out.println(add("1", "111"));
        System.out.println(add("0", "0"));
    }
}
