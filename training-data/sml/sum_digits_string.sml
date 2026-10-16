fun digitSum s =
  List.foldl (fn (c, acc) => if Char.isDigit c then acc + (ord c - ord #"0") else acc)
             0 (explode s)

val () = print (Int.toString (digitSum "a1b2c3") ^ "\n")
val () = print (Int.toString (digitSum (Int.toString 987654321)) ^ "\n")
