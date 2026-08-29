bool is_leap_year(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
}

void main() {
    stdout.printf("%s\n", is_leap_year(2000).to_string());
    stdout.printf("%s\n", is_leap_year(1900).to_string());
    stdout.printf("%s\n", is_leap_year(2024).to_string());
}
