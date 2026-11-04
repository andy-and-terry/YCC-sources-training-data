val digits = "0123456789abcdefghijklmnopqrstuvwxyz"

fun toBase (n, base) =
  let
    fun go (0, acc) = acc
      | go (k, acc) = go (k div base, String.str (String.sub (digits, k mod base)) ^ acc)
  in if n = 0 then "0" else go (n, "") end

val () = app (fn b => print ("255 in base " ^ Int.toString b ^ " = " ^ toBase (255, b) ^ "\n")) [2, 8, 16, 36]
