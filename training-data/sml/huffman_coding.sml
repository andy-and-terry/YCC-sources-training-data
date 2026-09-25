datatype huffman = Leaf of char * int | Node of huffman * huffman * int

fun weight (Leaf (_, w)) = w
  | weight (Node (_, _, w)) = w

fun insertSorted (t, []) = [t]
  | insertSorted (t, y :: ys) =
      if weight t <= weight y then t :: y :: ys else y :: insertSorted (t, ys)

fun buildTree [t] = t
  | buildTree (a :: b :: rest) = buildTree (insertSorted (Node (a, b, weight a + weight b), rest))
  | buildTree [] = raise Fail "empty frequency list"

fun codesOf (Leaf (c, _), prefix) = [(c, prefix)]
  | codesOf (Node (l, r, _), prefix) = codesOf (l, prefix ^ "0") @ codesOf (r, prefix ^ "1")

val freqs = [(#"a", 45), (#"b", 13), (#"c", 12), (#"d", 16), (#"e", 9), (#"f", 5)]

val initial = foldl (fn (f, acc) => insertSorted (Leaf f, acc)) [] freqs
val tree = buildTree initial
val codes = codesOf (tree, "")

val () = app (fn (c, code) => print (Char.toString c ^ ": " ^ code ^ "\n")) codes
