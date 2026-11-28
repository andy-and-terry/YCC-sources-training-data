fun fourSumCount (a, b, c, d) =
  let
    val pairSums = List.concat (map (fn x => map (fn y => x + y) b) a)
    fun occurrences k = length (List.filter (fn s => s = k) pairSums)
    val negPairs = List.concat (map (fn x => map (fn y => ~(x + y)) d) c)
  in
    foldl op+ 0 (map occurrences negPairs)
  end

val _ = print (Int.toString (fourSumCount ([1, 2], [~2, ~1], [~1, 2], [0, 2])) ^ "\n") (* 2 *)
