class MinStack {
    private List items = []

    void push(int x) {
        int m = items ? Math.min(x, items.last()[1]) : x
        items << [x, m]
    }

    int pop() { items.pop()[0] }   // Groovy's pop removes the last element
    int min() { items.last()[1] }
}

def s = new MinStack()
[5, 3, 7, 2].each { s.push(it) }
println s.min()
s.pop()
println s.min()
