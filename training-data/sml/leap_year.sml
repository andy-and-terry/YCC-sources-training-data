fun is_leap_year year =
  (year mod 4 = 0 andalso year mod 100 <> 0) orelse year mod 400 = 0

val () = print (Bool.toString (is_leap_year 2000) ^ "\n")
val () = print (Bool.toString (is_leap_year 1900) ^ "\n")
val () = print (Bool.toString (is_leap_year 2024) ^ "\n")
