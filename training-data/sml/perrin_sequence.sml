(* Perrin sequence P(n)=P(n-2)+P(n-3) *)
fun extend acc =
  let val n = length acc
  in acc @ [List.nth (acc, n - 2) + List.nth (acc, n - 3)] end

fun grow acc 0 = acc
  | grow acc k = grow (extend acc) (k - 1)

val v = grow [3, 0, 2] 7
val () = print (String.concatWith " " (List.map Int.toString v) ^ "\n")
