type point = real * real
type 'a pair = 'a * 'a

fun swap ((a, b) : 'a pair) : 'a pair = (b, a)
fun dist ((x1, y1) : point, (x2, y2) : point) =
    Math.sqrt ((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))

fun twice f x = f (f x)
fun id x = x
fun const a _ = a
fun pairUp x = (x, x)

val () = print (Real.toString (dist ((0.0, 0.0), (3.0, 4.0))) ^ "\n")
val (a, b) = swap (1, 2)
val () = print (Int.toString a ^ Int.toString b ^ "\n")
val () = print (Int.toString (twice (fn x => x + 2) 0) ^ "\n")
val () = print (twice (fn s => s ^ "!") "hi" ^ "\n")
val () = print (id "poly" ^ Int.toString (const 5 "ignored") ^ "\n")
val (p, q) = pairUp "z"
val () = print (p ^ q ^ "\n")
