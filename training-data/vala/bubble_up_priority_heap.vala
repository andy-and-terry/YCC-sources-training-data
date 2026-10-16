class MinHeap {
    private int[] data = {};

    public int size {
        get { return data.length; }
    }

    public void push (int value) {
        data += value;
        int i = data.length - 1;
        while (i > 0) {
            int parent = (i - 1) / 2;
            if (data[parent] <= data[i]) {
                break;
            }
            swap (parent, i);
            i = parent;
        }
    }

    public int pop () {
        int top = data[0];
        data[0] = data[data.length - 1];
        data.resize (data.length - 1);
        int i = 0;
        while (true) {
            int l = 2 * i + 1;
            int r = l + 1;
            int smallest = i;
            if (l < data.length && data[l] < data[smallest]) {
                smallest = l;
            }
            if (r < data.length && data[r] < data[smallest]) {
                smallest = r;
            }
            if (smallest == i) {
                break;
            }
            swap (i, smallest);
            i = smallest;
        }
        return top;
    }

    private void swap (int a, int b) {
        int t = data[a];
        data[a] = data[b];
        data[b] = t;
    }
}

void main () {
    var h = new MinHeap ();
    int[] input = { 8, 3, 9, 1, 6, 2 };
    foreach (var x in input) {
        h.push (x);
    }
    while (h.size > 0) {
        stdout.printf ("%d ", h.pop ());
    }
    stdout.printf ("\n");
}
