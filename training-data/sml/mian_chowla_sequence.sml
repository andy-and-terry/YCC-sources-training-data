(* Greedy sequence whose pairwise sums are all distinct. *)
fun member (_, []) = false
  | member (x, y :: ys) = x = y orelse member (x, ys)

fun distinct [] = true
  | distinct (x :: xs) = not (member (x, xs)) andalso distinct xs

fun build (seq, sums, cand) =
  if length seq = 8 then seq
  else
    let
      val fresh = map (fn x => x + cand) (seq @ [cand])
    in
      if distinct fresh andalso not (List.exists (fn s => member (s, sums)) fresh)
      then build (seq @ [cand], sums @ fresh, cand + 1)
      else build (seq, sums, cand + 1)
    end

val () = print (String.concatWith " " (map Int.toString (build ([], [], 1))) ^ "\n")
