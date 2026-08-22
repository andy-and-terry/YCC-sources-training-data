import java.util.BitSet;

public class BitSetDemo {
    public static void main(String[] args) {
        BitSet bs = new BitSet(8);
        bs.set(1);
        bs.set(3);
        bs.flip(3);
        System.out.println(bs.get(1) + " " + bs.get(3) + " " + bs.cardinality());
    }
}
