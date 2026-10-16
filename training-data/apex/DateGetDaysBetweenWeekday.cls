public class DateGetDaysBetweenWeekday {
    public static void main() {
        Date start = Date.newInstance(2024, 1, 1);
        Date finish = Date.newInstance(2024, 3, 1);
        System.debug(start.daysBetween(finish));
        System.debug(start.monthsBetween(finish));
        System.debug(Date.isLeapYear(2024));
        System.debug(Date.daysInMonth(2024, 2));
        System.debug(start.addDays(45));
        System.debug(start.toStartOfWeek());
    }
}
