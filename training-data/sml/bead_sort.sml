(* Bead (gravity) sort. *)
fun count p l = length (List.filter p l)
fun range a b = if a > b then [] else a :: range (a + 1) b
fun beadSort nums =
  let
    val mx = foldl Int.max 0 nums
    val cols = map (fn i => count (fn n => n >= i) nums) (range 1 mx)
  in
    rev (map (fn r => count (fn c => c >= r) cols) (range 1 (length nums)))
  end
val _ = print (String.concatWith "," (map Int.toString (beadSort [5, 3, 1, 4, 2])) ^ "\n")
