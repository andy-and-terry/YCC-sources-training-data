public class EnumValuesSwitchDemo {
    public enum Season { WINTER, SPRING, SUMMER, FALL }

    public static String describe(Season s) {
        switch on s {
            when WINTER { return 'cold'; }
            when SUMMER { return 'hot'; }
            when else   { return 'mild'; }
        }
    }

    public static void run() {
        for (Season s : Season.values()) {
            System.debug(s + ' -> ' + describe(s) + ' ordinal ' + s.ordinal());
        }
    }
}
