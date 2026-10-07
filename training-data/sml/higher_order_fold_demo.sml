fun foldr' f z [] = z
  | foldr' f z (x :: xs) = f (x, foldr' f z xs)

fun map' f = foldr' (fn (x, acc) => f x :: acc) []
fun filter' p = foldr' (fn (x, acc) => if p x then x :: acc else acc) []
fun compose fs = foldr' (fn (f, g) => f o g) (fn x => x) fs

fun show l = print (String.concatWith " " (map Int.toString l) ^ "\n")

val () = show (map' (fn x => x * 3) [1, 2, 3])
val () = show (filter' (fn x => x mod 2 = 1) [1, 2, 3, 4, 5])
val inc3 = compose [fn x => x + 1, fn x => x * 2, fn x => x - 3]
val () = print (Int.toString (inc3 10) ^ "\n")
val () = print (Int.toString (foldl (fn (x, acc) => acc * 10 + x) 0 [1, 2, 3]) ^ "\n")
val () = print (Int.toString (foldr (fn (x, acc) => acc * 10 + x) 0 [1, 2, 3]) ^ "\n")
val () = print (String.concat (foldl (fn (x, acc) => x :: acc) [] ["a", "b", "c"]) ^ "\n")
