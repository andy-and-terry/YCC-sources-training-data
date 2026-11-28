public class AddBinaryStrings {
    public static String addBinary(String a, String b) {
        Integer i = a.length() - 1, j = b.length() - 1, carry = 0;
        String result = '';
        while (i >= 0 || j >= 0 || carry > 0) {
            Integer sum = carry;
            if (i >= 0) {
                sum += Integer.valueOf(a.substring(i, i + 1));
                i--;
            }
            if (j >= 0) {
                sum += Integer.valueOf(b.substring(j, j + 1));
                j--;
            }
            result = String.valueOf(Math.mod(sum, 2)) + result;
            carry = sum / 2;
        }
        return result;
    }

    public static void demo() {
        System.debug(addBinary('1010', '1011')); // 10101
    }
}
