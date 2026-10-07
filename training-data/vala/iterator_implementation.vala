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
            return current > 0;
        }

        public int get() {
            return current;
        }
    }
}

void main() {
    foreach (int n in new Countdown(5)) {
        stdout.printf("%d ", n);
    }
    stdout.printf("liftoff\n");
}
