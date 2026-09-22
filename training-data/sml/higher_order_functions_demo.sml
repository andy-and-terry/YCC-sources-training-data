fun pipeline nums =
  let
    val evens = List.filter (fn x => x mod 2 = 0) nums
    val squared = map (fn x => x * x) evens
    val total = foldl (op +) 0 squared
  in
    total
  end

fun sumRight nums = foldr (op +) 0 nums

fun reverseViaFoldl lst = foldl (fn (x, acc) => x :: acc) [] lst

val () = print (Int.toString (pipeline [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) ^ "\n")
val () = print (Int.toString (sumRight [1, 2, 3, 4, 5]) ^ "\n")
val () = print (String.concatWith " " (map Int.toString (reverseViaFoldl [1, 2, 3, 4, 5])) ^ "\n")
