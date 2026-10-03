import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Duration;
import java.time.Period;
import java.time.format.DateTimeFormatter;

public class LocalDateTimeDemo {
    public static void main(String[] args) {
        LocalDate start = LocalDate.of(2024, 1, 15);
        LocalDate end = LocalDate.of(2024, 6, 1);
        Period between = Period.between(start, end);
        System.out.printf("gap: %d months, %d days%n", between.getMonths(), between.getDays());

        LocalDateTime meeting = LocalDateTime.of(2024, 3, 10, 14, 30);
        LocalDateTime followUp = meeting.plusDays(7).plusHours(2);
        System.out.println("follow-up: " + followUp.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));

        Duration elapsed = Duration.between(meeting, followUp);
        System.out.println("elapsed hours: " + elapsed.toHours());
    }
}
