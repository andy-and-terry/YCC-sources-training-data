fun minimumTotal triangle =
  let
    fun step (row, below) =
      let
        fun go ([], _) = []
          | go (v :: vs, l :: (rest as r :: _)) = (v + Int.min (l, r)) :: go (vs, rest)
          | go _ = raise Fail "malformed triangle"
      in
        go (row, below)
      end
    val rows = rev triangle
  in
    hd (foldl step (hd rows) (tl rows))
  end

val _ = print (Int.toString (minimumTotal [[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]) ^ "\n") (* 11 *)
