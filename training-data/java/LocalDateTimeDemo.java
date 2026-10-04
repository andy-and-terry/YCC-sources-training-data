import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;

public class LocalDateTimeDemo {
    public static void main(String[] args) {
        LocalDate date = LocalDate.of(2024, 1, 31);
        System.out.println(date.plusMonths(1));
        System.out.println(date.isLeapYear() + " " + date.getDayOfWeek());
        System.out.println(date.with(TemporalAdjusters.next(DayOfWeek.MONDAY)));
        System.out.println(date.with(TemporalAdjusters.lastDayOfMonth()));

        LocalDate other = LocalDate.of(2025, 3, 15);
        Period p = Period.between(date, other);
        System.out.println(p.getYears() + "y " + p.getMonths() + "m " + p.getDays() + "d");
        System.out.println(ChronoUnit.DAYS.between(date, other) + " days");

        LocalDateTime start = LocalDateTime.of(2024, 5, 1, 9, 30);
        LocalDateTime end = start.plusHours(26).plusMinutes(45);
        System.out.println(Duration.between(start, end));

        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("EEE, dd MMM yyyy HH:mm");
        System.out.println(end.format(fmt));
        System.out.println(LocalDate.parse("2030-12-25").getDayOfYear());
    }
}
