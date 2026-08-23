let is_power_of_two n = n > 0 && n land (n - 1) = 0

let () =
  print_endline (string_of_bool (is_power_of_two 16));
  print_endline (string_of_bool (is_power_of_two 18))
