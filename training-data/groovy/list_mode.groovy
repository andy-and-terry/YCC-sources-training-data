def modes(List items) {
    def counts = items.countBy { it }
    def top = counts.values().max()
    counts.findAll { it.value == top }.keySet().sort()
}
println modes([1, 2, 2, 3, 3, 4])
