public class DateTimeFormatDemo {
    public static void main() {
        Date d = Date.newInstance(2024, 2, 28);
        System.debug(d.addDays(2));                      // 2024-03-01 (leap year)
        System.debug(d.addMonths(12));
        System.debug(d.toStartOfMonth());
        System.debug(d.dayOfYear());
        System.debug(Date.isLeapYear(2024));
        System.debug(Date.daysInMonth(2023, 2));

        Date start = Date.newInstance(2024, 1, 1);
        Date finish = Date.newInstance(2024, 12, 25);
        System.debug(start.daysBetween(finish));

        Datetime dt = Datetime.newInstanceGmt(2024, 7, 4, 15, 30, 0);
        System.debug(dt.formatGmt('yyyy-MM-dd HH:mm:ss'));
        System.debug(dt.formatGmt('EEEE, MMM d, yyyy'));
        System.debug(dt.addHours(10).formatGmt('hh:mm a'));
        System.debug(dt.getTime());

        Date parsed = Date.valueOf('2025-03-15');
        System.debug(parsed.year() + '/' + parsed.month() + '/' + parsed.day());
    }
}
