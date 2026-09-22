fun lowbit i = Word.toInt (Word.andb (Word.fromInt i, Word.fromInt (~i)))

fun fenwick_update (tree, i, delta) =
  let
    fun loop idx =
      if idx < Array.length tree then
        (Array.update (tree, idx, Array.sub (tree, idx) + delta);
         loop (idx + lowbit idx))
      else ()
  in
    loop (i + 1)
  end

fun fenwick_prefix_sum (tree, i) =
  let
    fun loop (idx, sum) =
      if idx > 0 then loop (idx - lowbit idx, sum + Array.sub (tree, idx))
      else sum
  in
    loop (i + 1, 0)
  end

fun fenwick_range_sum (tree, l, r) =
  fenwick_prefix_sum (tree, r) - (if l = 0 then 0 else fenwick_prefix_sum (tree, l - 1))

fun build_fenwick values =
  let
    val n = Array.length values
    val tree = Array.array (n + 1, 0)
    fun loop i =
      if i < n then (fenwick_update (tree, i, Array.sub (values, i)); loop (i + 1))
      else ()
  in
    loop 0;
    tree
  end

val values = Array.fromList [1, 3, 5, 7, 9, 11]
val tree = build_fenwick values
val () = print (Int.toString (fenwick_prefix_sum (tree, 3)) ^ "\n")
val () = print (Int.toString (fenwick_range_sum (tree, 1, 4)) ^ "\n")
