fun isAutomorphic n =
  let
    val sq = Int.toString (n * n)
    val s = Int.toString n
    val start = String.size sq - String.size s
  in start >= 0 andalso String.extract (sq, start, NONE) = s end

val result = List.filter isAutomorphic (List.tabulate (1000, fn i => i))
val _ = print (String.concatWith " " (map Int.toString result) ^ "\n")
(* 0 1 5 6 25 76 376 625 *)
