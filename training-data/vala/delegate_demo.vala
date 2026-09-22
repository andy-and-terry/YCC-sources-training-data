delegate int Transform(int x);
delegate bool Predicate(int x);

int[] map_array(int[] arr, Transform fn) {
    int[] result = {};
    foreach (int x in arr) {
        result += fn(x);
    }
    return result;
}

int[] filter_array(int[] arr, Predicate fn) {
    int[] result = {};
    foreach (int x in arr) {
        if (fn(x)) result += x;
    }
    return result;
}

int square(int x) {
    return x * x;
}

bool is_even(int x) {
    return x % 2 == 0;
}

void main() {
    int[] data = { 1, 2, 3, 4, 5, 6 };

    foreach (int x in map_array(data, square)) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");

    foreach (int x in filter_array(data, is_even)) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");

    Transform double_it = (x) => x * 2;
    foreach (int x in map_array(data, double_it)) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
