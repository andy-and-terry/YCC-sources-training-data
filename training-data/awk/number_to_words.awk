#!/usr/bin/awk -f
function words(n,   ones, tens) {
    split("one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen", ones, " ")
    split("x twenty thirty forty fifty sixty seventy eighty ninety", tens, " ")
    if (n == 0) return "zero"
    if (n < 20) return ones[n]
    if (n < 100) return tens[int(n / 10)] (n % 10 ? "-" ones[n % 10] : "")
    return ones[int(n / 100)] " hundred" (n % 100 ? " " words(n % 100) : "")
}
BEGIN {
    print words(7); print words(42); print words(305); print words(999)
}
