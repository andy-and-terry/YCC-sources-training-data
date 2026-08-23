proc isLeapYear(year: int): bool =
  result = (year mod 4 == 0 and year mod 100 != 0) or year mod 400 == 0

echo isLeapYear(2000)
echo isLeapYear(1900)
echo isLeapYear(2024)
