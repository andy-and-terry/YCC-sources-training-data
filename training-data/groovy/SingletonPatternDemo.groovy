class Singleton {
    private static Singleton instance
    int counter = 0

    private Singleton() {}

    static Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton()
        }
        return instance
    }

    void increment() {
        counter++
    }
}

def a = Singleton.getInstance()
a.increment()
def b = Singleton.getInstance()
b.increment()
println a.counter
println(a.is(b))
