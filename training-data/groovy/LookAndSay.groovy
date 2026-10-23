// Run-length describe a digit string: "1211" -> "111221"
String nextTerm(String s) {
    s.findAll(/(.)\1*/) { match, d -> "${match.size()}${d}" }.join()
}

String s = '1'
7.times {
    println s
    s = nextTerm(s)
}
