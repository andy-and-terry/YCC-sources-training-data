public class DateTimeDemo {
    public static void run() {
        Date d = Date.newInstance(2024, 1, 31);
        System.debug(d.addMonths(1));            // 2024-02-29
        System.debug(d.addDays(30));
        System.debug(d.toStartOfWeek());
        System.debug(Date.isLeapYear(2024));
        System.debug(Date.daysInMonth(2024, 2));

        Date other = Date.newInstance(2024, 12, 25);
        System.debug(d.daysBetween(other));

        Datetime dt = Datetime.newInstanceGmt(2024, 3, 15, 10, 30, 0);
        System.debug(dt.formatGmt('yyyy-MM-dd HH:mm:ss'));
        System.debug(dt.addHours(5).hourGmt());
        System.debug(dt.dateGmt());

        Time t = Time.newInstance(9, 15, 0, 0);
        System.debug(t.addMinutes(50));
    }
}
