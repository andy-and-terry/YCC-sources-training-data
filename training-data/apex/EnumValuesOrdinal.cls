public class EnumValuesOrdinal {
    public enum Level { LOW, MEDIUM, HIGH }

    public static void main() {
        for (Level l : Level.values()) {
            System.debug(l.name() + ' ordinal ' + l.ordinal());
        }
        Level chosen = Level.valueOf('HIGH');
        System.debug(chosen == Level.HIGH);
    }
}
