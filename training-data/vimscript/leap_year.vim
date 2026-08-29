function! IsLeapYear(year)
  return (a:year % 4 == 0 && a:year % 100 != 0) || a:year % 400 == 0
endfunction

echo IsLeapYear(2000)
echo IsLeapYear(1900)
echo IsLeapYear(2024)
