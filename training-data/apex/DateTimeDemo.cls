public class DateTimeDemo {
    public static void main() {
        Date d = Date.newInstance(2024, 2, 28);
        System.debug('next day: ' + d.addDays(1));
        System.debug('leap year: ' + Date.isLeapYear(d.year()));
        System.debug('days in month: ' + Date.daysInMonth(d.year(), d.month()));
        System.debug('start of month: ' + d.toStartOfMonth());

        Date later = Date.newInstance(2024, 12, 25);
        System.debug('days between: ' + d.daysBetween(later));

        Datetime dt = Datetime.newInstanceGmt(2024, 5, 17, 13, 45, 0);
        System.debug(dt.formatGmt('yyyy-MM-dd HH:mm:ss'));
        System.debug(dt.addHours(12).formatGmt('EEEE, MMM d'));
    }
}
