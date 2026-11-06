(* Count contiguous subarrays whose sum equals k (running sums from each start). *)
fun sumsFrom [] _ _ = 0
  | sumsFrom (x :: xs) acc k =
      (if acc + x = k then 1 else 0) + sumsFrom xs (acc + x) k

fun countSubarrays [] _ = 0
  | countSubarrays (l as _ :: rest) k = sumsFrom l 0 k + countSubarrays rest k

val () = print (Int.toString (countSubarrays [1, 1, 1] 2) ^ "\n")
