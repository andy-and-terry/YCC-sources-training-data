(* Cantor pairing function and its inverse. *)
fun pair (x, y) = (x + y) * (x + y + 1) div 2 + y

fun unpair z =
  let
    val w = (Real.floor (Math.sqrt (Real.fromInt (8 * z + 1))) - 1) div 2
    val y = z - w * (w + 1) div 2
  in (w - y, y) end

val () = print (Int.toString (pair (3, 4)) ^ "\n")
val (x, y) = unpair 32
val () = print (Int.toString x ^ " " ^ Int.toString y ^ "\n")
