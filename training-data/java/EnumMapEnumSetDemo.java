import java.util.EnumMap;
import java.util.EnumSet;
import java.util.Map;

public class EnumMapEnumSetDemo {
    enum Day { MON, TUE, WED, THU, FRI, SAT, SUN }

    public static void main(String[] args) {
        EnumSet<Day> weekend = EnumSet.of(Day.SAT, Day.SUN);
        EnumSet<Day> weekdays = EnumSet.complementOf(weekend);
        System.out.println("Weekdays: " + weekdays);
        System.out.println("Range: " + EnumSet.range(Day.TUE, Day.THU));

        Map<Day, Integer> hours = new EnumMap<>(Day.class);
        hours.put(Day.WED, 6);
        hours.put(Day.MON, 8);
        hours.put(Day.FRI, 4);
        // EnumMap iterates in declaration order, not insertion order
        hours.forEach((d, h) -> System.out.println(d + " -> " + h));
    }
}
