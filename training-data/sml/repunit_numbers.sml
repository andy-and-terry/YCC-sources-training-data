(* Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1. *)
fun show r = Int.toString r ^ (if r mod 3 = 0 then "  (divisible by 3)" else "") ^ "\n"

fun loop (n, r) =
  if n > 8 then ()
  else let val next = r * 10 + 1 in print (show next); loop (n + 1, next) end

val () = loop (1, 0)
