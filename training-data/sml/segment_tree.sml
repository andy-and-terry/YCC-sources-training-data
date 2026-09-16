fun build (arr, tree, node, start, stop) =
  if start = stop then
    Array.update (tree, node, Array.sub (arr, start))
  else
    let
      val mid = (start + stop) div 2
    in
      build (arr, tree, 2 * node + 1, start, mid);
      build (arr, tree, 2 * node + 2, mid + 1, stop);
      Array.update (tree, node, Array.sub (tree, 2 * node + 1) + Array.sub (tree, 2 * node + 2))
    end

fun query (tree, node, start, stop, l, r) =
  if r < start orelse stop < l then 0
  else if l <= start andalso stop <= r then Array.sub (tree, node)
  else
    let
      val mid = (start + stop) div 2
    in
      query (tree, 2 * node + 1, start, mid, l, r) + query (tree, 2 * node + 2, mid + 1, stop, l, r)
    end

fun make_segment_tree arr =
  let
    val n = Array.length arr
    val tree = Array.array (4 * n, 0)
  in
    build (arr, tree, 0, 0, n - 1);
    tree
  end

val arr = Array.fromList [1, 3, 5, 7, 9, 11]
val tree = make_segment_tree arr
val () = print (Int.toString (query (tree, 0, 0, Array.length arr - 1, 1, 3)) ^ "\n")
val () = print (Int.toString (query (tree, 0, 0, Array.length arr - 1, 0, 5)) ^ "\n")
