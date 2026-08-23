let
  isLeapYear = year:
    (year - (year / 4) * 4 == 0 && year - (year / 100) * 100 != 0)
    || year - (year / 400) * 400 == 0;
in
  {
    y2000 = isLeapYear 2000;
    y1900 = isLeapYear 1900;
    y2024 = isLeapYear 2024;
  }
