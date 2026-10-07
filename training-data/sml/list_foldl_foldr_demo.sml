fun show_ints xs = "[" ^ String.concatWith ", " (map Int.toString xs) ^ "]"

val sum = foldl (op +) 0 [1, 2, 3, 4]
val () = print (Int.toString sum ^ "\n")

(* foldl visits left to right, so cons reverses; foldr preserves order *)
val reversed = foldl (op ::) [] [1, 2, 3]
val copied = foldr (op ::) [] [1, 2, 3]
val () = print (show_ints reversed ^ " " ^ show_ints copied ^ "\n")

val minus_left = foldl (fn (x, acc) => acc - x) 0 [1, 2, 3]
val minus_right = foldr (fn (x, acc) => x - acc) 0 [1, 2, 3]
val () = print (Int.toString minus_left ^ " " ^ Int.toString minus_right ^ "\n")

val longest =
  foldl (fn (s, best) => if size s > size best then s else best) ""
        ["fig", "banana", "kiwi"]
val () = print (longest ^ "\n")

val maximum = foldl Int.max (hd [3, 9, 2]) [3, 9, 2]
val () = print (Int.toString maximum ^ "\n")

val joined = foldr (fn (s, acc) => if acc = "" then s else s ^ "-" ^ acc) "" ["a", "b", "c"]
val () = print (joined ^ "\n")

val digits_to_int = foldl (fn (d, acc) => acc * 10 + d) 0 [4, 2, 0]
val () = print (Int.toString digits_to_int ^ "\n")
