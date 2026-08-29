fun is_power_of_two n = n > 0 andalso Word.toInt (Word.andb (Word.fromInt n, Word.fromInt (n - 1))) = 0

val () = print (Bool.toString (is_power_of_two 16) ^ "\n")
val () = print (Bool.toString (is_power_of_two 18) ^ "\n")
