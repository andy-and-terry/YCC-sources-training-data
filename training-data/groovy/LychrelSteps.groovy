// Reverse-and-add until a palindrome; count the steps.
BigInteger rev(BigInteger n) { new BigInteger(n.toString().reverse()) }

int steps(int start) {
    BigInteger n = start
    for (int count = 0; count < 100; count++) {
        if (count > 0 && n == rev(n)) return count
        n += rev(n)
    }
    return -1
}

println([56, 57, 59, 79, 89].collect { steps(it) }.join(' '))
