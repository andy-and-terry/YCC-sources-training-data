public class GouldSequence {
    static int gould(int n) {
        return 1 << Integer.bitCount(n);
    }

    public static void main(String[] args) {
        for (int n = 0; n < 16; n++) System.out.print(gould(n) + " ");
        System.out.println();
    }
}
