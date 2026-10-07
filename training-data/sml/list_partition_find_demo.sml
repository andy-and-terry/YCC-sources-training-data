fun show xs = "[" ^ String.concatWith ", " (map Int.toString xs) ^ "]"

val nums = [5, 12, 8, 3, 20, 7, 14]

val (big, small) = List.partition (fn x => x >= 10) nums
val () = print (show big ^ " " ^ show small ^ "\n")

val first_even = List.find (fn x => x mod 2 = 0) nums
val () = print (case first_even of SOME v => Int.toString v | NONE => "none")
val () = print "\n"

val none_found = List.find (fn x => x > 100) nums
val () = print (case none_found of SOME _ => "found" | NONE => "none") 
val () = print "\n"

val () = print (show (List.filter (fn x => x mod 2 = 1) nums) ^ "\n")
val () = print (Bool.toString (List.exists (fn x => x = 3) nums) ^ " ")
val () = print (Bool.toString (List.all (fn x => x > 0) nums) ^ "\n")

val mapped = List.mapPartial (fn x => if x > 10 then SOME (x * 2) else NONE) nums
val () = print (show mapped ^ "\n")

val () = print (show (List.take (nums, 3)) ^ " " ^ show (List.drop (nums, 3)) ^ "\n")
val () = print (Int.toString (List.nth (nums, 4)) ^ "\n")
val () = print (show (List.rev nums) ^ "\n")
val () = print (show (List.concat [[1, 2], [3], []]) ^ "\n")
val () = print (Int.toString (List.length (List.tabulate (6, fn i => i * i))) ^ "\n")
val () = print (show (List.last nums :: []) ^ "\n")
