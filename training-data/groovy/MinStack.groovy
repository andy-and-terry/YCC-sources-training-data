class MinStack {
    List<Integer> data = []
    List<Integer> mins = []

    void push(int value) {
        data << value
        mins << (mins.isEmpty() ? value : Math.min(value, mins[-1]))
    }

    int pop() {
        mins.remove(mins.size() - 1)
        data.remove(data.size() - 1)
    }

    int top() { data[-1] }
    int getMin() { mins[-1] }
}

def stack = new MinStack()
stack.push(5)
stack.push(2)
stack.push(8)
println "min: ${stack.getMin()}"
stack.pop()
println "min after pop: ${stack.getMin()}"
println "top: ${stack.top()}"
