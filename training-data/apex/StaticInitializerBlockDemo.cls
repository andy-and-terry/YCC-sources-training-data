public class StaticInitializerBlockDemo {
    public static final Map<String, Integer> PRIORITY;
    public static Integer instanceCount = 0;

    static {
        PRIORITY = new Map<String, Integer>();
        PRIORITY.put('High', 1);
        PRIORITY.put('Medium', 2);
        PRIORITY.put('Low', 3);
    }

    public Integer id;

    {
        instanceCount++;
        id = instanceCount;
    }

    public static void run() {
        new StaticInitializerBlockDemo();
        StaticInitializerBlockDemo second = new StaticInitializerBlockDemo();
        System.debug('Second id: ' + second.id);
        System.debug('High priority: ' + PRIORITY.get('High'));
    }
}
