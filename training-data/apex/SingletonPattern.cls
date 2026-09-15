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

    public Integer next() {
        counter++;
        return counter;
    }

    public static void main() {
        SingletonPattern a = SingletonPattern.getInstance();
        SingletonPattern b = SingletonPattern.getInstance();
        System.debug(a.next());
        System.debug(b.next());
        System.debug(a == b);
    }
}
