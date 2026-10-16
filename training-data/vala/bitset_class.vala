class BitSet {
    private uint32[] words;
    public int capacity { get; private set; }

    public BitSet (int capacity) {
        this.capacity = capacity;
        words = new uint32[(capacity + 31) / 32];
    }

    public void set_bit (int i) {
        words[i / 32] |= (uint32) 1 << (i % 32);
    }

    public void clear_bit (int i) {
        words[i / 32] &= ~((uint32) 1 << (i % 32));
    }

    public bool test (int i) {
        return (words[i / 32] & ((uint32) 1 << (i % 32))) != 0;
    }

    public int count () {
        int total = 0;
        foreach (var w in words) {
            uint32 x = w;
            while (x != 0) {
                x &= x - 1;
                total++;
            }
        }
        return total;
    }
}

void main () {
    var bs = new BitSet (100);
    bs.set_bit (3);
    bs.set_bit (64);
    bs.set_bit (99);
    bs.clear_bit (3);
    stdout.printf ("%s %s %d\n", bs.test (3).to_string (), bs.test (64).to_string (), bs.count ());
}
