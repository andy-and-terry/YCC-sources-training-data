val inc = fn x => x + 1
val double = fn x => x * 2

val inc_then_double = double o inc
val double_then_inc = inc o double

val () = print (Int.toString (inc_then_double 5) ^ " " ^ Int.toString (double_then_inc 5) ^ "\n")

fun compose_all fs = foldr (op o) (fn x => x) fs
val pipeline = compose_all [inc, double, inc]
val () = print (Int.toString (pipeline 3) ^ "\n")

fun twice f = f o f
val () = print (Int.toString (twice double 3) ^ "\n")

fun repeat 0 _ = (fn x => x)
  | repeat n f = f o repeat (n - 1) f
val () = print (Int.toString (repeat 10 double 1) ^ "\n")

infix 1 |>
fun x |> f = f x
val result = 5 |> inc |> double |> Int.toString
val () = print (result ^ "\n")

val upcase_first_word = String.map Char.toUpper o hd o String.tokens Char.isSpace
val () = print (upcase_first_word "hello big world" ^ "\n")

val sum_of_squares = foldl (op +) 0 o map (fn x => x * x)
val () = print (Int.toString (sum_of_squares [1, 2, 3]) ^ "\n")

fun both p q x = p x andalso q x
val is_positive_even = both (fn x => x > 0) (fn x => x mod 2 = 0)
val () = print (Bool.toString (is_positive_even 4) ^ " " ^ Bool.toString (is_positive_even ~2) ^ "\n")
