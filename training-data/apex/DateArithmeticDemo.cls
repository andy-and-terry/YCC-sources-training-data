public class DateArithmeticDemo {
    public static Boolean isWeekend(Date d) {
        Date monday = Date.newInstance(1900, 1, 1);
        Integer dow = Math.mod(monday.daysBetween(d), 7);
        return dow == 5 || dow == 6;
    }

    public static void main() {
        Date start = Date.newInstance(2024, 1, 31);
        System.debug('addMonths(1): ' + start.addMonths(1));
        System.debug('addDays(30): ' + start.addDays(30));
        System.debug('addYears(1): ' + start.addYears(1));

        Date endDate = Date.newInstance(2024, 12, 25);
        System.debug('days between: ' + start.daysBetween(endDate));
        System.debug('toStartOfMonth: ' + endDate.toStartOfMonth());
        System.debug('daysInMonth(Feb 2024): ' + Date.daysInMonth(2024, 2));
        System.debug('2024-06-15 weekend? ' + isWeekend(Date.newInstance(2024, 6, 15)));
        System.debug('2024-06-17 weekend? ' + isWeekend(Date.newInstance(2024, 6, 17)));
    }
}
