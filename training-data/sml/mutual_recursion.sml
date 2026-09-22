fun is_even 0 = true
  | is_even n = is_odd (n - 1)
and is_odd 0 = false
  | is_odd n = is_even (n - 1)

val () = print (Bool.toString (is_even 10) ^ "\n")
val () = print (Bool.toString (is_odd 10) ^ "\n")
val () = print (Bool.toString (is_even 7) ^ "\n")
