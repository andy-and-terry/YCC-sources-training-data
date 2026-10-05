fun showInts l = "[" ^ String.concatWith "," (map Int.toString l) ^ "]"

val names = ["ann", "bob", "cy"]
val scores = [90, 85, 77]

val pairs = ListPair.zip (names, scores)
val () = List.app (fn (n, s) => print (n ^ ": " ^ Int.toString s ^ "\n")) pairs

val (ns, ss) = ListPair.unzip pairs
val () = print (showInts ss ^ " " ^ String.concatWith "," ns ^ "\n")

val sums = ListPair.map (op +) ([1, 2, 3], [10, 20, 30])
val () = print (showInts sums ^ "\n")

val dot = ListPair.foldl (fn (a, b, acc) => acc + a * b) 0 ([1, 2, 3], [4, 5, 6])
val () = print (Int.toString dot ^ "\n")

val () = print (Bool.toString (ListPair.all (op =) ([1, 2], [1, 2])) ^ " ")
val () = print (Bool.toString (ListPair.exists (fn (a, b) => a > b) ([1, 2], [3, 1])) ^ "\n")
val () = print (Int.toString (length (ListPair.zip ([1, 2, 3], [4, 5]))) ^ "\n")
