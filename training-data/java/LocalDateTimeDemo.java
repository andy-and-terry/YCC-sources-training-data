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
        LocalDate d = LocalDate.of(2024, 2, 28);
        System.out.println(d.plusDays(2) + " leap=" + d.isLeapYear());
        System.out.println(d.with(TemporalAdjusters.lastDayOfMonth()));
        System.out.println(d.with(TemporalAdjusters.next(DayOfWeek.MONDAY)));
        System.out.println(Period.between(d, LocalDate.of(2025, 5, 1)));
        System.out.println(ChronoUnit.DAYS.between(d, LocalDate.of(2024, 12, 25)));

        LocalDateTime t = LocalDateTime.of(2024, 3, 15, 13, 45);
        System.out.println(t.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")));
        System.out.println(Duration.between(t, t.plusHours(5).plusMinutes(20)));
        System.out.println(LocalDate.parse("2024-12-31").getDayOfWeek());
    }
}
