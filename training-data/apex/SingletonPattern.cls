public class SingletonPattern {
    private static SingletonPattern instance;
    private Integer counter;

    private SingletonPattern() {
        counter = 0;
    }

    public static SingletonPattern getInstance() {
        if (instance == null) {
            instance = new SingletonPattern();
        }
        return instance;
    }

    public void increment() {
        counter++;
    }

    public Integer getCounter() {
        return counter;
    }

    public static void main() {
        SingletonPattern first = SingletonPattern.getInstance();
        first.increment();
        first.increment();

        SingletonPattern second = SingletonPattern.getInstance();
        second.increment();

        System.debug(first === second);
        System.debug(second.getCounter());
    }
}
