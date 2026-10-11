public class NumberFormatParsing {
    static Integer tryParse(String s) {
        try {
            return Integer.parseInt(s.trim());
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static void main(String[] args) {
        String[] inputs = {"42", " 7 ", "-15", "3.14", "abc", "", "2147483648"};
        for (String in : inputs) {
            System.out.println("'" + in + "' -> " + tryParse(in));
        }
        System.out.println(Integer.parseInt("ff", 16) + " " + Integer.parseInt("-101", 2));
        System.out.println(Long.parseLong("9000000000") + " " + Double.parseDouble("1e3"));
        System.out.println(Integer.toString(255, 36) + " " + Integer.parseUnsignedInt("4294967295"));
    }
}
