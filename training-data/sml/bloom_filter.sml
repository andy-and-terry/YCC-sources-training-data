(* A tiny bloom filter over strings using two hash functions and a
   fixed-size bit array (represented as an int array of 0/1). *)
val size = 64

fun hash1 s = (Char.ord (String.sub (s, 0)) * 31 + String.size s) mod size
fun hash2 s =
  CharVector.foldl (fn (c, acc) => (acc * 131 + Char.ord c) mod size) 7 s

fun make_filter () = Array.array (size, 0)

fun add (filter, s) =
  (Array.update (filter, hash1 s, 1);
   Array.update (filter, hash2 s, 1))

fun might_contain (filter, s) =
  Array.sub (filter, hash1 s) = 1 andalso Array.sub (filter, hash2 s) = 1

val filter = make_filter ()
val () = app (fn s => add (filter, s)) ["apple", "banana", "cherry"]

val () = print (Bool.toString (might_contain (filter, "apple")) ^ "\n")
val () = print (Bool.toString (might_contain (filter, "durian")) ^ "\n")
