(* IntInf provides arbitrary-precision integers. *)
fun fact (n : IntInf.int) : IntInf.int =
  if n <= 1 then 1 else n * fact (n - 1)

fun fibPair 0 = (0 : IntInf.int, 1 : IntInf.int)
  | fibPair n =
      let val (a, b) = fibPair (n - 1) in (b, a + b) end

fun digitSum (n : IntInf.int) =
  List.foldl (fn (c, acc) => acc + (Char.ord c - Char.ord #"0")) 0
             (String.explode (IntInf.toString n))

fun power (b : IntInf.int, e : int) : IntInf.int =
  if e = 0 then 1
  else
    let val half = power (b, e div 2)
    in if e mod 2 = 0 then half * half else half * half * b end

val () = print (IntInf.toString (fact 30) ^ "\n")
val () = print (IntInf.toString (#1 (fibPair 150)) ^ "\n")
val () = print (Int.toString (digitSum (fact 100)) ^ "\n")
val () = print (IntInf.toString (power (2, 128)) ^ "\n")
val () = print (IntInf.toString (#2 (IntInf.divMod (fact 20, 1000000007))) ^ "\n")
