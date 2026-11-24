// Moser-de Bruijn sequence: binary digits of n read in base 4.
public class MoserDeBruijn {
    public static void main(String[] args) {
        for (int n = 0; n < 12; n++)
            System.out.print(Integer.parseInt(Integer.toBinaryString(n), 4) + " ");
        System.out.println();
    }
}
