(* Narayana's cows N(n)=N(n-1)+N(n-3) *)
fun extend acc =
  let val n = length acc
  in acc @ [List.nth (acc, n - 1) + List.nth (acc, n - 3)] end

fun grow acc 0 = acc
  | grow acc k = grow (extend acc) (k - 1)

val v = grow [1, 1, 1] 7
val () = print (String.concatWith " " (List.map Int.toString v) ^ "\n")
