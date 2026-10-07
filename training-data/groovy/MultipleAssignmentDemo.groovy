def (quotient, remainder) = [17.intdiv(5), 17 % 5]
println "${quotient} remainder ${remainder}"

def (first, second, third) = ["Alice", "Bob", "Carol"]
println "${first}, ${second}, ${third}"

def swap(a, b) {
    return [b, a]
}

def (x, y) = swap(1, 2)
println "${x}, ${y}"

def coordinates = [10, 20, 30]
def (lat, lon) = coordinates
println "${lat}, ${lon}"
