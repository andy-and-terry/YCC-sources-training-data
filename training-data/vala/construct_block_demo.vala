public class Config : Object {
    public string name { get; construct; }
    public int retries { get; construct set; }

    static int instance_count = 0;

    construct {
        instance_count++;
        if (retries <= 0) {
            retries = 3;
        }
    }

    public Config(string name, int retries) {
        Object(name: name, retries: retries);
    }

    public static int count() {
        return instance_count;
    }
}

void main() {
    var a = new Config("primary", 5);
    var b = new Config("secondary", 0);

    stdout.printf("%s retries=%d\n", a.name, a.retries);
    stdout.printf("%s retries=%d\n", b.name, b.retries);
    stdout.printf("instances: %d\n", Config.count());
}
