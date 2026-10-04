public class StaticInitializerDemo {
    public static final Map<String, Integer> PRIORITY_RANK;
    public Integer instanceId;

    static {
        PRIORITY_RANK = new Map<String, Integer>();
        PRIORITY_RANK.put('Low', 1);
        PRIORITY_RANK.put('Medium', 2);
        PRIORITY_RANK.put('High', 3);
    }

    private static Integer nextId = 1;

    {
        instanceId = nextId++;
    }

    public static void main() {
        StaticInitializerDemo a = new StaticInitializerDemo();
        StaticInitializerDemo b = new StaticInitializerDemo();
        System.debug('ids: ' + a.instanceId + ', ' + b.instanceId);
        System.debug('High rank: ' + PRIORITY_RANK.get('High'));
    }
}
