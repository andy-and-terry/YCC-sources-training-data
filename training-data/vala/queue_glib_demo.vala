void main() {
    var queue = new Queue<string>();
    queue.push_tail("first");
    queue.push_tail("second");
    queue.push_head("urgent");

    stdout.printf("length: %u\n", queue.get_length());
    stdout.printf("peek: %s\n", queue.peek_head());

    while (!queue.is_empty()) {
        stdout.printf("pop: %s\n", queue.pop_head());
    }

    var seq = new Sequence<int>();
    foreach (int n in new int[] {5, 1, 4, 2}) {
        seq.insert_sorted(n, (a, b) => a - b);
    }
    var it = seq.get_begin_iter();
    while (!it.is_end()) {
        stdout.printf("%d ", it.get());
        it = it.next();
    }
    stdout.printf("\n");
}
