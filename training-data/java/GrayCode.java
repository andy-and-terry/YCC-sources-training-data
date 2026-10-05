public class GrayCode {
    public static int[] grayCode(int n) {
        int[] out = new int[1 << n];
        for (int i = 0; i < out.length; i++) out[i] = i ^ (i >> 1);
        return out;
    }

    public static void main(String[] args) {
        for (int g : grayCode(3)) {
            System.out.println(String.format("%3s", Integer.toBinaryString(g)).replace(' ', '0'));
        }
    }
}
