public class LeapYear {
    public static Boolean isLeapYear(Integer year) {
        return (Math.mod(year, 4) == 0 && Math.mod(year, 100) != 0) || Math.mod(year, 400) == 0;
    }

    public static void main() {
        for (Integer y : new List<Integer>{2000, 1900, 2024, 2023}) {
            System.debug(y + ': ' + isLeapYear(y));
        }
    }
}
