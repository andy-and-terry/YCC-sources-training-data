class IntStack {
    private int[] data = new int[2];
    private int size = 0;

    public void push (int v) {
        if (size == data.length) {
            data.resize (data.length * 2);
        }
        data[size++] = v;
    }

    public int pop () requires (size > 0) {
        return data[--size];
    }

    public int capacity { get { return data.length; } }
}

void main () {
    var s = new IntStack ();
    for (int i = 1; i <= 5; i++) {
        s.push (i * i);
    }
    print ("capacity %d\n", s.capacity);
    print ("%d %d\n", s.pop (), s.pop ());
}
