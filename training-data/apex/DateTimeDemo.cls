public class DateTimeDemo {
    public static void main() {
        Date d = Date.newInstance(2024, 2, 28);
        Date next = d.addDays(2);
        System.debug(next); // 2024-03-01 (leap year)
        System.debug(Date.isLeapYear(2024));
        System.debug(d.daysBetween(next));
        System.debug(d.toStartOfWeek());

        Datetime dt = Datetime.newInstanceGmt(2024, 5, 17, 13, 45, 0);
        System.debug(dt.formatGmt('yyyy-MM-dd HH:mm:ss'));
        System.debug(dt.addHours(12).formatGmt('EEE, d MMM yyyy'));
        Time t = Time.newInstance(9, 30, 0, 0);
        System.debug(t.addMinutes(45));
    }
}
