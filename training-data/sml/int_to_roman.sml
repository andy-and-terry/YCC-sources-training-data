(* Integer (1..3999) to Roman numeral using a greedy table. *)
val table =
  [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
   (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]

fun toRoman 0 _ = ""
  | toRoman n ((v, s) :: rest) =
      if n >= v then s ^ toRoman (n - v) ((v, s) :: rest) else toRoman n rest
  | toRoman _ [] = ""

val () = print (toRoman 1994 table ^ " " ^ toRoman 58 table ^ "\n")
