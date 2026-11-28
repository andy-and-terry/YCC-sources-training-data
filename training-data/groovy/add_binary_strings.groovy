String addBinary(String a, String b) {
    int i = a.length() - 1, j = b.length() - 1, carry = 0
    def sb = new StringBuilder()
    while (i >= 0 || j >= 0 || carry > 0) {
        int sum = carry
        if (i >= 0) sum += Character.digit(a.charAt(i--), 10)
        if (j >= 0) sum += Character.digit(b.charAt(j--), 10)
        sb.append(sum % 2)
        carry = sum.intdiv(2)
    }
    sb.reverse().toString()
}

println addBinary("1010", "1011") // 10101
