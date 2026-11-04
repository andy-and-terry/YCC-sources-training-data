List<String> wrap(String text, int width) {
    def lines = []
    String line = ''
    text.split(/\s+/).each { word ->
        if (line && line.size() + 1 + word.size() > width) {
            lines << line
            line = word
        } else {
            line = line ? "$line $word" : word
        }
    }
    if (line) lines << line
    lines
}

wrap('the quick brown fox jumps over the lazy dog', 15).each { println "|${it.padRight(15)}|" }
