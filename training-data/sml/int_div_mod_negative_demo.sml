(* SML's div and mod round toward negative infinity, unlike quot and rem. *)
fun show (label, n) = print (label ^ " = " ^ Int.toString n ^ "\n")

val _ = show ("7 div 2", 7 div 2)
val _ = show ("~7 div 2", ~7 div 2)
val _ = show ("7 div ~2", 7 div ~2)
val _ = show ("7 mod 3", 7 mod 3)
val _ = show ("~7 mod 3", ~7 mod 3)
val _ = show ("7 mod ~3", 7 mod ~3)

(* Int.quot and Int.rem truncate toward zero *)
val _ = show ("quot(~7,2)", Int.quot (~7, 2))
val _ = show ("rem(~7,2)", Int.rem (~7, 2))

(* Property: a = (a div b) * b + (a mod b) *)
fun check (a, b) = a = (a div b) * b + (a mod b)
val _ = print (Bool.toString (check (~17, 5)) ^ "\n")

val r = (1 div 0) handle Div => ~1
val _ = show ("1 div 0 handled", r)
