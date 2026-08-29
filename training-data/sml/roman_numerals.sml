val values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"),
              (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"),
              (5, "V"), (4, "IV"), (1, "I")]

fun to_roman 0 = ""
  | to_roman n =
      let
        val (value, symbol) = valOf (List.find (fn (v, _) => v <= n) values)
      in
        symbol ^ to_roman (n - value)
      end

val () = print (to_roman 1994 ^ "\n")
