String columnTitle(int n) {
    def sb = new StringBuilder()
    while (n > 0) {
        n--
        sb.append((char) (65 + n % 26))
        n = n.intdiv(26)
    }
    sb.reverse().toString()
}

println "${columnTitle(28)} ${columnTitle(701)}" // AB ZY
