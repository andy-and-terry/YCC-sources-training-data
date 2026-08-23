bool isLeapYear(int year) {
  return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
}

void main() {
  for (final year in [2000, 1900, 2024, 2023]) {
    print('$year: ${isLeapYear(year)}');
  }
}
