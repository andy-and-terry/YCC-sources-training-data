#include <array>
#include <iostream>
#include <string>

std::string words(int n) {
    static const std::array<const char *, 20> ones = {
        "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
        "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
        "seventeen", "eighteen", "nineteen"};
    static const std::array<const char *, 10> tens = {
        "", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
    if (n < 20) return ones[n];
    if (n < 100) return std::string(tens[n / 10]) + (n % 10 ? "-" + std::string(ones[n % 10]) : "");
    if (n < 1000) return std::string(ones[n / 100]) + " hundred" + (n % 100 ? " " + words(n % 100) : "");
    return words(n / 1000) + " thousand" + (n % 1000 ? " " + words(n % 1000) : "");
}

int main() {
    for (int n : {0, 13, 42, 100, 999, 12345}) std::cout << n << " -> " << words(n) << '\n';
}
