def wordCount(text) {
    def counts = [:].withDefault { 0 }
    text.toLowerCase().split(/\s+/).each { word -> counts[word] += 1 }
    return counts.sort { -it.value }
}

def result = wordCount("the quick brown fox jumps over the lazy dog the fox runs")
result.take(3).each { word, count -> println "${word}: ${count}" }
