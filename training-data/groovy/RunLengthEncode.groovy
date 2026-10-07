String runLengthEncode(String s) {
    if (!s) return ""
    def sb = new StringBuilder()
    int count = 1
    for (i in 1..<s.length()) {
        if (s[i] == s[i - 1]) {
            count++
        } else {
            sb << s[i - 1] << count
            count = 1
        }
    }
    sb << s[-1] << count
    sb.toString()
}

println runLengthEncode("aaabbbcccd")
println runLengthEncode("wwwwaaadexxxxxx")
