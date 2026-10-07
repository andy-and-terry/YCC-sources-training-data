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
        LocalDate d = LocalDate.of(2024, 1, 31);
        System.out.println(d.plusMonths(1) + " " + d.isLeapYear() + " " + d.getDayOfWeek());
        System.out.println(d.with(TemporalAdjusters.next(DayOfWeek.MONDAY)));

        LocalDateTime dt = LocalDateTime.of(2024, 3, 15, 9, 30);
        System.out.println(dt.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")));
        System.out.println(Duration.between(dt, dt.plusHours(5).plusMinutes(10)));
        System.out.println(Period.between(d, LocalDate.of(2025, 3, 1)));
        System.out.println(ChronoUnit.DAYS.between(d, LocalDate.of(2024, 12, 25)));
        System.out.println(LocalDate.parse("2023-07-04").getMonth());
    }
}
