val names = ["ann", "bo", "cy"]
val ages = [31, 25, 47]

val pairs = ListPair.zip (names, ages)
val () = List.app (fn (n, a) => print (n ^ ":" ^ Int.toString a ^ " ")) pairs
val () = print "\n"

val (ns, as') = ListPair.unzip pairs
val () = print (String.concatWith "," ns ^ "\n")

val sums = ListPair.map (fn (a, b) => a + b) ([1, 2, 3], [10, 20, 30])
val () = print (String.concatWith " " (map Int.toString sums) ^ "\n")

fun dot (u, v) = ListPair.foldl (fn (a, b, acc) => acc + a * b) 0 (u, v)
val () = print (Int.toString (dot ([1, 2, 3], [4, 5, 6])) ^ "\n")

val () = print (Bool.toString (ListPair.all (op =) ([1, 2], [1, 2])) ^ "\n")
val () = print (Bool.toString (ListPair.exists (fn (a, b) => a > b) ([1, 2], [3, 1])) ^ "\n")

val short = ListPair.zip ([1, 2, 3], ["a", "b"])
val () = print (Int.toString (length short) ^ "\n")

val lookup = fn k => Option.map #2 (List.find (fn (n, _) => n = k) pairs)
val () = print (case lookup "bo" of SOME a => Int.toString a | NONE => "?")
val () = print "\n"
