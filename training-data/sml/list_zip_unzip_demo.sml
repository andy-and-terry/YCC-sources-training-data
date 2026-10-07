fun show_pair (a, b) = "(" ^ Int.toString a ^ "," ^ b ^ ")"

val pairs = ListPair.zip ([1, 2, 3], ["a", "b", "c"])
val () = print (String.concatWith " " (map show_pair pairs) ^ "\n")

val (nums, strs) = ListPair.unzip pairs
val () = print (String.concat strs ^ " " ^ Int.toString (foldl (op +) 0 nums) ^ "\n")

(* zip stops at the shorter list *)
val short = ListPair.zip ([1, 2, 3, 4], ["x", "y"])
val () = print (Int.toString (length short) ^ "\n")

val sums = ListPair.map (op +) ([1, 2, 3], [10, 20, 30])
val () = print (String.concatWith "," (map Int.toString sums) ^ "\n")

val all_pos = ListPair.all (fn (a, b) => a > 0 andalso b > 0) ([1, 2], [3, 4])
val exists_big = ListPair.exists (fn (a, b) => a + b > 100) ([1, 2], [3, 4])
val () = print (Bool.toString all_pos ^ " " ^ Bool.toString exists_big ^ "\n")

fun dot (xs, ys) = ListPair.foldl (fn (x, y, acc) => acc + x * y) 0 (xs, ys)
val () = print (Int.toString (dot ([1, 2, 3], [4, 5, 6])) ^ "\n")

val indexed = ListPair.zip (List.tabulate (3, fn i => i), ["p", "q", "r"])
val () = print (String.concatWith " " (map show_pair indexed) ^ "\n")

val () = ListPair.app (fn (a, b) => print (Int.toString a ^ b ^ " ")) ([1, 2], ["u", "v"])
val () = print "\n"
