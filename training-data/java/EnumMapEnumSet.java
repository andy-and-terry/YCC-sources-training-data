import java.util.*;

public class EnumMapEnumSet {
    enum Day { MON, TUE, WED, THU, FRI, SAT, SUN }

    public static void main(String[] args) {
        EnumSet<Day> weekend = EnumSet.of(Day.SAT, Day.SUN);
        System.out.println(EnumSet.complementOf(weekend));
        EnumMap<Day, Integer> hours = new EnumMap<>(Day.class);
        hours.put(Day.WED, 8); hours.put(Day.MON, 6);
        System.out.println(hours);
        System.out.println(EnumSet.range(Day.TUE, Day.THU));
    }
}
