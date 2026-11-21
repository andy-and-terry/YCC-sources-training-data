(* Disarium numbers: digits raised to their 1-based positions sum to n. *)
fun pow (b, 0) = 1
  | pow (b, e) = b * pow (b, e - 1)

fun isDisarium n =
  let
    val ds = map (fn c => ord c - ord #"0") (String.explode (Int.toString n))
    fun go ([], _, acc) = acc
      | go (d :: rest, i, acc) = go (rest, i + 1, acc + pow (d, i))
  in go (ds, 1, 0) = n end

fun range (a, b) = if a > b then [] else a :: range (a + 1, b)

val () = print (String.concatWith " " (map Int.toString (List.filter isDisarium (range (1, 999)))) ^ "\n")
