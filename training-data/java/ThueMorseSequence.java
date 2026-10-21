// Thue-Morse: t(n) is the parity of the number of 1 bits in n
public class ThueMorseSequence {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 0; n < 32; n++) sb.append(Integer.bitCount(n) % 2);
        System.out.println(sb);
    }
}
