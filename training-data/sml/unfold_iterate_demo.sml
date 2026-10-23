fun unfold f seed =
  case f seed of
    NONE => []
  | SOME (x, next) => x :: unfold f next

fun iterate n f x =
  if n = 0 then [] else x :: iterate (n - 1) f (f x)

fun show xs = print (String.concatWith "," (map Int.toString xs) ^ "\n")

val () = show (iterate 8 (fn x => x * 2) 1)

val () = show (unfold (fn n => if n > 5 then NONE else SOME (n * n, n + 1)) 1)

val digits =
  unfold (fn n => if n = 0 then NONE else SOME (n mod 10, n div 10)) 9042

val () = show (rev digits)

val collatz =
  unfold (fn 1 => NONE
           | n => SOME (n, if n mod 2 = 0 then n div 2 else 3 * n + 1)) 6

val () = show collatz
