public class BaseNConvert {
    public static void main(String[] args) {
        for (int base : new int[]{2, 8, 16, 36}) {
            System.out.println("255 in base " + base + " = " + Integer.toString(255, base));
        }
        System.out.println(Integer.parseInt("zz", 36));
        try {
            Integer.parseInt("9", 8);
        } catch (NumberFormatException e) {
            System.out.println("rejected: " + e.getMessage());
        }
    }
}
