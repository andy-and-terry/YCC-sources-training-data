public class SingletonPattern {
    static class Singleton {
        private static Singleton instance;
        final int value;

        private Singleton(int value) {
            this.value = value;
        }

        static synchronized Singleton getInstance(int value) {
            if (instance == null) instance = new Singleton(value);
            return instance;
        }
    }

    public static void main(String[] args) {
        Singleton a = Singleton.getInstance(1);
        Singleton b = Singleton.getInstance(2);
        System.out.println((a == b) + " " + a.value + " " + b.value);
    }
}
