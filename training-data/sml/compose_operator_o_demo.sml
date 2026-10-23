(* The infix operator o composes functions: (f o g) x = f (g x). *)
fun inc x = x + 1
fun double x = x * 2

val incThenDouble = double o inc
val doubleThenInc = inc o double

val _ = print (Int.toString (incThenDouble 5) ^ "\n")   (* 12 *)
val _ = print (Int.toString (doubleThenInc 5) ^ "\n")   (* 11 *)

(* Point-free pipelines *)
val shout = String.map Char.toUpper o String.implode o List.rev o String.explode
val _ = print (shout "abc" ^ "\n")

val sumSquares = foldl op+ 0 o map (fn x => x * x)
val _ = print (Int.toString (sumSquares [1, 2, 3]) ^ "\n")

(* Composing a list of functions with foldr *)
fun composeAll fs = foldr (op o) (fn x => x) fs
val f = composeAll [inc, double, inc]
val _ = print (Int.toString (f 3) ^ "\n")   (* inc (double (inc 3)) = 9 *)
