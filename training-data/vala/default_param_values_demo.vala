string greet(string name, string greeting = "Hello", string punctuation = "!") {
    return "%s, %s%s".printf(greeting, name, punctuation);
}

int power(int base, int exponent = 2) {
    int result = 1;
    for (int i = 0; i < exponent; i++) {
        result *= base;
    }
    return result;
}

double scale(double value, double factor = 1.0, double offset = 0.0) {
    return value * factor + offset;
}

class Logger : Object {
    public string prefix;
    public int level;

    public Logger(string prefix = "app", int level = 1) {
        this.prefix = prefix;
        this.level = level;
    }

    public void log(string message, int min_level = 0) {
        if (level >= min_level) {
            stdout.printf("[%s] %s\n", prefix, message);
        }
    }
}

void main() {
    stdout.printf("%s\n", greet("Ann"));
    stdout.printf("%s\n", greet("Bob", "Welcome"));
    stdout.printf("%s\n", greet("Cy", "Hey", "?"));

    stdout.printf("%d %d %d\n", power(5), power(2, 10), power(3, 0));
    stdout.printf("%.1f %.1f %.1f\n", scale(2.0), scale(2.0, 3.0), scale(2.0, 3.0, 1.0));

    var a = new Logger();
    var b = new Logger("db", 3);
    a.log("starting");
    a.log("verbose detail", 2);
    b.log("connected");
    b.log("query ok", 2);
}
