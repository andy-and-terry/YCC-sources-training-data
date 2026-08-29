bool is_armstrong(int n) {
    string digits_str = n.to_string();
    int power = digits_str.length;
    int total = 0;
    for (int i = 0; i < digits_str.length; i++) {
        int d = (int)(digits_str[i] - '0');
        total += (int) Math.pow(d, power);
    }
    return total == n;
}

void main() {
    stdout.printf("%s\n", is_armstrong(153).to_string());
    stdout.printf("%s\n", is_armstrong(154).to_string());
}
