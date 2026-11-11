// Repunits: numbers made only of the digit 1.
public class RepunitNumbers {
    public static void main(String[] args) {
        long r = 0;
        for (int i = 0; i < 5; i++) {
            r = r * 10 + 1;
            System.out.print(r + " ");
        }
        System.out.println();
    }
}
