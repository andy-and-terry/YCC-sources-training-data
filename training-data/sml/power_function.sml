fun my_power (base, 0) = 1
  | my_power (base, exp) =
      if exp mod 2 = 0 then
        let val half = my_power (base, exp div 2) in half * half end
      else base * my_power (base, exp - 1)

val () = print (Int.toString (my_power (2, 10)) ^ "\n")
val () = print (Int.toString (my_power (3, 5)) ^ "\n")
