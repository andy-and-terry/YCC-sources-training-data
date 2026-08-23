let is_leap_year year = (year mod 4 = 0 && year mod 100 <> 0) || year mod 400 = 0

let () =
  print_endline (string_of_bool (is_leap_year 2000));
  print_endline (string_of_bool (is_leap_year 1900));
  print_endline (string_of_bool (is_leap_year 2024))
