(* Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits. *)
fun digits n = map (fn c => ord c - ord #"0") (String.explode (Int.toString n))

fun take (0, _) = []
  | take (k, x :: xs) = x :: take (k - 1, xs)
  | take (_, []) = []

fun isKeith n =
  let
    val k = length (digits n)
    (* seq is kept newest-first *)
    fun go seq =
      let val last = hd seq
      in
        if last >= n then last = n
        else go (foldl op+ 0 (take (k, seq)) :: seq)
      end
  in go (rev (digits n)) end

fun range (a, b) = if a > b then [] else a :: range (a + 1, b)

val () = print (String.concatWith " " (map Int.toString (List.filter isKeith (range (10, 1199)))) ^ "\n")
