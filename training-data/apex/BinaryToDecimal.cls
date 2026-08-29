public class BinaryToDecimal {
    public static Integer binaryToDecimal(String bin) {
        Integer result = 0;
        for (Integer i = 0; i < bin.length(); i++) {
            result = result * 2 + (bin.substring(i, i + 1) == '1' ? 1 : 0);
        }
        return result;
    }

    public static void main() {
        System.debug(binaryToDecimal('110101'));
    }
}
