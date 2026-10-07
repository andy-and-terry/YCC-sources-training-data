val xs = [3, 1, 4, 1, 5, 9, 2, 6]

val () = print (Int.toString (List.foldl op+ 0 xs) ^ "\n")
val () = print (Int.toString (List.length (List.filter (fn x => x > 3) xs)) ^ "\n")
val () = print (Int.toString (valOf (List.find (fn x => x > 4) xs)) ^ "\n")
val () = print (Bool.toString (List.exists (fn x => x = 9) xs) ^ "\n")
val () = print (Bool.toString (List.all (fn x => x > 0) xs) ^ "\n")
val (small, big) = List.partition (fn x => x < 4) xs
val () = print (String.concatWith "," (map Int.toString small) ^ " | "
                ^ String.concatWith "," (map Int.toString big) ^ "\n")
val () = print (String.concatWith "," (map Int.toString (List.take (xs, 3))) ^ "\n")
val () = print (String.concatWith "," (map Int.toString (List.drop (xs, 5))) ^ "\n")
val () = print (String.concatWith "," (map Int.toString (List.rev xs)) ^ "\n")
val () = print (Int.toString (List.nth (xs, 4)) ^ "\n")
