import java.util.EnumMap;
import java.util.EnumSet;
import java.util.Map;

public class EnumMapDemo {
    enum Day { MON, TUE, WED, THU, FRI, SAT, SUN }

    public static void main(String[] args) {
        Map<Day, Integer> hours = new EnumMap<>(Day.class);
        hours.put(Day.WED, 6);
        hours.put(Day.MON, 8);
        hours.put(Day.FRI, 4);
        System.out.println(hours);

        EnumSet<Day> weekend = EnumSet.of(Day.SAT, Day.SUN);
        EnumSet<Day> weekdays = EnumSet.complementOf(weekend);
        System.out.println(weekdays);
        System.out.println(EnumSet.range(Day.TUE, Day.THU));
    }
}
