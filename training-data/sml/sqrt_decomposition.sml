val a = Vector.fromList [5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5]
val bs = 4
val blk = Vector.fromList (List.tabulate (3, fn b =>
  List.foldl op+ 0 (List.tabulate (bs, fn j => Vector.sub (a, b * bs + j)))))

fun query (i, r, acc) =
  if i > r then acc
  else if i mod bs = 0 andalso i + bs - 1 <= r
    then query (i + bs, r, acc + Vector.sub (blk, i div bs))
    else query (i + 1, r, acc + Vector.sub (a, i))

val () = print (Int.toString (query (2, 9, 0)) ^ "\n")
