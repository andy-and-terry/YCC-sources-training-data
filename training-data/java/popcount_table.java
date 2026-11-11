// Population count (number of set bits) for 0..15
public class PopcountTable {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 0; n < 16; n++) sb.append(Integer.bitCount(n)).append(' ');
        System.out.println(sb.toString().trim());
    }
}
