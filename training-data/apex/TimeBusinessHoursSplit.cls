public class TimeBusinessHoursSplit {
    public static Integer minutesBetween(Time a, Time b) {
        Long ms = b.millisecond() + 1000L * (b.second() + 60 * (b.minute() + 60 * b.hour()))
                - (a.millisecond() + 1000L * (a.second() + 60 * (a.minute() + 60 * a.hour())));
        return (Integer) (ms / 60000);
    }

    public static void main() {
        Time open = Time.newInstance(9, 0, 0, 0);
        Time close = Time.newInstance(17, 30, 0, 0);
        System.debug(minutesBetween(open, close));
        System.debug(open.addHours(2));
    }
}
