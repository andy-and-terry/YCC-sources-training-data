public class BinaryDecimalConvert {
    public static int binaryToDecimal(String binary) {
        return Integer.parseInt(binary, 2);
    }

    public static String decimalToBinary(int n) {
        return Integer.toBinaryString(n);
    }

    public static void main(String[] args) {
        System.out.println(binaryToDecimal("1010"));
        System.out.println(decimalToBinary(10));
    }
}
