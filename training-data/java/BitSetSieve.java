import java.util.BitSet;

public class BitSetSieve {
    public static void main(String[] args) {
        int n = 50;
        BitSet composite = new BitSet(n + 1);
        for (int i = 2; i * i <= n; i++)
            if (!composite.get(i)) for (int j = i * i; j <= n; j += i) composite.set(j);
        StringBuilder sb = new StringBuilder();
        for (int i = 2; i <= n; i++) if (!composite.get(i)) sb.append(i).append(' ');
        System.out.println(sb.toString().trim());
    }
}
