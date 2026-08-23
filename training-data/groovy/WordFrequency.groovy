def wordFrequency(String text) {
    def freq = [:].withDefault { 0 }
    text.toLowerCase().split(' ').each { word ->
        freq[word]++
    }
    return freq
}

println wordFrequency("the quick brown fox the lazy fox")
