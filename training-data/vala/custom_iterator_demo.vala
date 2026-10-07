class Countdown : Object {
    private int start;

    public Countdown(int start) {
        this.start = start;
    }

    public Iterator iterator() {
        return new Iterator(start);
    }

    public class Iterator : Object {
        private int current;

        public Iterator(int start) {
            current = start + 1;
        }

        public bool next() {
            current--;
            return current >= 0;
        }

        public int get() {
            return current;
        }
    }
}

class Fibonacci : Object {
    private int limit;

    public Fibonacci(int limit) {
        this.limit = limit;
    }

    public Iterator iterator() {
        return new Iterator(limit);
    }

    public class Iterator : Object {
        private int a = 0;
        private int b = 1;
        private int limit;
        private int cur = 0;
        private bool started = false;

        public Iterator(int limit) {
            this.limit = limit;
        }

        public bool next() {
            if (started) {
                int t = a + b;
                a = b;
                b = t;
            }
            started = true;
            cur = a;
            return cur <= limit;
        }

        public int get() {
            return cur;
        }
    }
}

void main() {
    foreach (int n in new Countdown(5)) {
        stdout.printf("%d ", n);
    }
    stdout.printf("liftoff\n");

    foreach (int f in new Fibonacci(50)) {
        stdout.printf("%d ", f);
    }
    stdout.printf("\n");
}
