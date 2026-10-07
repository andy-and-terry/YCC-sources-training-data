(* ListPair operations *)
val names = ["a", "b", "c"]
val nums = [1, 2, 3]

val zipped = ListPair.zip (names, nums)
val (ns, is) = ListPair.unzip zipped

val () = print (String.concatWith ", " (map (fn (n, i) => n ^ "=" ^ Int.toString i) zipped) ^ "\n")
val dot = ListPair.foldl (fn (a, b, acc) => a * b + acc) 0 ([1, 2, 3], [4, 5, 6])
val () = print (Int.toString dot ^ "\n")
val sums = ListPair.map op+ ([1, 2, 3], [10, 20, 30])
val () = print (String.concatWith " " (map Int.toString sums) ^ "\n")
val () = print (Bool.toString (ListPair.all (op <) ([1, 2], [2, 3])) ^ "\n")
