class RangeIterator implements Iterator<Integer> {
    int current, stop, step

    RangeIterator(int start, int stop, int step = 1) {
        this.current = start
        this.stop = stop
        this.step = step
    }

    boolean hasNext() { current < stop }

    Integer next() {
        def value = current
        current += step
        value
    }
}

def it = new RangeIterator(0, 10, 2)
while (it.hasNext()) {
    println it.next()
}

// Groovy collections already implement Iterable, so plugging a custom
// Iterator into a for-in loop works the same way.
def names = ["a", "b", "c"]
for (n in names) {
    println "name: $n"
}
