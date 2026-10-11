public class StaticCounterVariable {
    private static Integer instances = 0;
    public final Integer id;

    public StaticCounterVariable() {
        instances++;
        id = instances;
    }

    public static Integer getInstances() {
        return instances;
    }

    public static void main() {
        new StaticCounterVariable();
        new StaticCounterVariable();
        StaticCounterVariable third = new StaticCounterVariable();
        System.debug(third.id);
        System.debug(getInstances());
    }
}
