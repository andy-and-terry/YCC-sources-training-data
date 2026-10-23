val nums = [1, 2, 3, 4, 5, 6]
val (evens, odds) = List.partition (fn x => x mod 2 = 0) nums
val total = foldr (op +) 0 nums
val joined = foldr (fn (x, acc) => Int.toString x ^ "," ^ acc) "" nums
val () = print (Int.toString (length evens) ^ " " ^ Int.toString (length odds) ^ "\n")
val () = print (Int.toString total ^ "\n")
val () = print (joined ^ "\n")
val () = print (Int.toString (List.nth (nums, 2)) ^ "\n")
