public class SingletonPattern {
    private static SingletonPattern instance;
    private Integer callCount = 0;

    private SingletonPattern() {
    }

    public static SingletonPattern getInstance() {
        if (instance == null) {
            instance = new SingletonPattern();
        }
        return instance;
    }

    public Integer recordCall() {
        callCount++;
        return callCount;
    }

    public static void main() {
        SingletonPattern a = SingletonPattern.getInstance();
        SingletonPattern b = SingletonPattern.getInstance();
        a.recordCall();
        a.recordCall();
        System.debug(b.recordCall());
        System.debug(a === b);
    }
}
