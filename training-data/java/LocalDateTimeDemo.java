import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;

public class LocalDateTimeDemo {
    public static void main(String[] args) {
        LocalDate date = LocalDate.of(2024, 2, 28);
        System.out.println(date.plusDays(2));
        System.out.println(date.isLeapYear());
        System.out.println(date.with(TemporalAdjusters.lastDayOfMonth()));
        System.out.println(date.with(TemporalAdjusters.next(DayOfWeek.MONDAY)));

        Period p = Period.between(LocalDate.of(2000, 1, 15), date);
        System.out.println(p.getYears() + " years, " + p.getMonths() + " months");

        LocalDateTime start = LocalDateTime.of(2024, 3, 1, 9, 30);
        LocalDateTime end = start.plusHours(5).plusMinutes(45);
        System.out.println(Duration.between(start, end).toMinutes() + " minutes");

        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("EEE, dd MMM yyyy HH:mm");
        System.out.println(end.format(fmt));
        System.out.println(LocalDate.parse("2024-12-25").getDayOfWeek());
    }
}
