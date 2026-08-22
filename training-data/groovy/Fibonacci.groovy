def fibonacci(n) {
    def result = []
    def a = 0
    def b = 1
    n.times {
        result << a
        def temp = a + b
        a = b
        b = temp
    }
    return result
}

println fibonacci(11)
