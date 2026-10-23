(* SML div/mod round toward negative infinity; quot/rem truncate toward zero. *)
fun show (label, v) = print (label ^ " = " ^ Int.toString v ^ "\n")

val _ = show ("7 div 2", 7 div 2)
val _ = show ("~7 div 2", ~7 div 2)       (* ~4 *)
val _ = show ("7 mod 2", 7 mod 2)
val _ = show ("~7 mod 2", ~7 mod 2)       (* 1: sign follows divisor *)
val _ = show ("7 mod ~2", 7 mod ~2)       (* ~1 *)

val _ = show ("Int.quot(~7, 2)", Int.quot (~7, 2))   (* ~3 *)
val _ = show ("Int.rem(~7, 2)", Int.rem (~7, 2))     (* ~1 *)

(* Identity: a = (a div b) * b + (a mod b) *)
fun check (a, b) = a = (a div b) * b + (a mod b)
val _ = print (Bool.toString (check (~17, 5)) ^ "\n")

(* Proper wraparound index using mod *)
fun wrap (i, n) = i mod n
val _ = show ("wrap(~1, 5)", wrap (~1, 5))   (* 4 *)

(* Division by zero raises Div *)
val r = (1 div 0) handle Div => ~1
val _ = show ("1 div 0 handled", r)

val _ = show ("abs ~9", abs ~9)
val _ = show ("Int.sign ~9", Int.sign ~9)
val _ = show ("Int.min", Int.min (3, ~3))
