import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class LocalDateTimeApi {
    public static void main(String[] args) {
        LocalDate d = LocalDate.of(2024, 2, 28).plusDays(2);
        System.out.println(d + " " + d.getDayOfWeek() + " " + d.isLeapYear());
        System.out.println(ChronoUnit.DAYS.between(LocalDate.of(2024, 1, 1), d));
        System.out.println(LocalDateTime.of(2024, 5, 6, 7, 8).format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")));
        System.out.println(Duration.ofMinutes(135) + " " + Period.between(LocalDate.of(2000, 1, 15), LocalDate.of(2024, 3, 1)));
    }
}
