fun show xs = "[" ^ String.concatWith "," (map Int.toString xs) ^ "]"

fun take_while p [] = []
  | take_while p (x :: xs) = if p x then x :: take_while p xs else []

fun drop_while p [] = []
  | drop_while p (l as x :: xs) = if p x then drop_while p xs else l

fun span p xs = (take_while p xs, drop_while p xs)

fun group_runs [] = []
  | group_runs (x :: xs) =
      let
        val (same, rest) = span (fn y => y = x) xs
      in
        (x :: same) :: group_runs rest
      end

fun chunk _ [] = []
  | chunk n xs =
      let
        val k = Int.min (n, length xs)
      in
        List.take (xs, k) :: chunk n (List.drop (xs, k))
      end

val () = print (show (take_while (fn x => x < 5) [1, 3, 5, 2]) ^ "\n")
val () = print (show (drop_while (fn x => x < 5) [1, 3, 5, 2]) ^ "\n")

val runs = group_runs [1, 1, 2, 3, 3, 3, 1]
val () = print (String.concatWith " " (map show runs) ^ "\n")
val () = print (String.concatWith " " (map (fn r => Int.toString (hd r) ^ "x" ^ Int.toString (length r)) runs) ^ "\n")

val () = print (String.concatWith " " (map show (chunk 3 [1, 2, 3, 4, 5, 6, 7])) ^ "\n")
