delegate int IntMap (int x);
delegate bool IntPred (int x);

int[] map_ints (int[] src, IntMap f) {
    int[] result = new int[src.length];
    for (int i = 0; i < src.length; i++) {
        result[i] = f (src[i]);
    }
    return result;
}

int[] filter_ints (int[] src, IntPred p) {
    int[] result = {};
    foreach (var x in src) {
        if (p (x)) {
            result += x;
        }
    }
    return result;
}

void print_all (int[] a) {
    foreach (var x in a) {
        stdout.printf ("%d ", x);
    }
    stdout.printf ("\n");
}

void main () {
    int[] nums = { 1, 2, 3, 4, 5, 6, 7, 8 };
    print_all (map_ints (nums, (x) => x * x));
    print_all (filter_ints (nums, (x) => x % 2 == 0));
}
