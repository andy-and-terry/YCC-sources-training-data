import std.stdio;

string addBinary(string a, string b) {
    long i = cast(long) a.length - 1, j = cast(long) b.length - 1;
    int carry = 0;
    string result;
    while (i >= 0 || j >= 0 || carry > 0) {
        int sum = carry;
        if (i >= 0) sum += a[i--] - '0';
        if (j >= 0) sum += b[j--] - '0';
        result = cast(char)('0' + sum % 2) ~ result;
        carry = sum / 2;
    }
    return result;
}

void main() {
    writeln(addBinary("1010", "1011")); // 10101
}
