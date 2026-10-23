public class DatetimeGmtFormatDemo {
    public static void run() {
        // newInstanceGmt avoids dependence on the running user's time zone
        Datetime dt = Datetime.newInstanceGmt(2024, 3, 15, 14, 30, 5);

        System.debug(dt.formatGmt('yyyy-MM-dd'));            // 2024-03-15
        System.debug(dt.formatGmt('HH:mm:ss'));              // 14:30:05
        System.debug(dt.formatGmt('EEEE, MMM d'));           // Friday, Mar 15
        System.debug(dt.formatGmt('yyyy-MM-dd\'T\'HH:mm:ss\'Z\'')); // ISO form

        // Round trip through valueOfGmt
        Datetime parsed = Datetime.valueOfGmt('2024-03-15 14:30:05');
        System.debug('Round trip equal: ' + (parsed == dt));

        // Add time, then compare as milliseconds
        Datetime later = dt.addHours(36);
        Long diffMs = later.getTime() - dt.getTime();
        System.debug('Hours apart: ' + (diffMs / (1000 * 60 * 60)));

        System.debug('Day of year: ' + dt.dayOfYearGmt());
    }
}
