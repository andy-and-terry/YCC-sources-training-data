class Configuration : Object {
    static Configuration? instance = null;
    public int counter { get; set; default = 0; }

    private Configuration() {
    }

    public static Configuration get_instance() {
        if (instance == null) {
            instance = new Configuration();
        }
        return instance;
    }

    public void increment() {
        counter++;
    }
}

void main() {
    var a = Configuration.get_instance();
    a.increment();
    a.increment();

    var b = Configuration.get_instance();
    b.increment();

    stdout.printf("%d\n", a.counter);
    stdout.printf("%s\n", (a == b).to_string());
}
