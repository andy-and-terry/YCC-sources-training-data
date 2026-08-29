bool is_power_of_two(int n) {
    return n > 0 && (n & (n - 1)) == 0;
}

void main() {
    stdout.printf("%s\n", is_power_of_two(16).to_string());
    stdout.printf("%s\n", is_power_of_two(18).to_string());
}
