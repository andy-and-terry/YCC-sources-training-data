val n = 8
fun cell r c = if Word.andb (Word.fromInt r, Word.fromInt c) = Word.fromInt c then "* " else "  "
fun row r =
  String.concat (List.tabulate (n - r - 1, fn _ => " ") @ List.tabulate (r + 1, cell r)) ^ "\n"
val () = List.app (fn r => print (row r)) (List.tabulate (n, fn r => r))
