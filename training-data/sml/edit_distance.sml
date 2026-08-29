fun edit_distance (a, b) =
  let
    val m = String.size a
    val n = String.size b
    val table = Array2.array (m + 1, n + 1, 0)
    val () = Array2.modifyi Array2.RowMajor (fn (i, j, _) =>
      if j = 0 then i else if i = 0 then j else 0) table
    fun compute (i, j) =
      if i > m then ()
      else if j > n then compute (i + 1, 1)
      else
        let
          val cost = if String.sub (a, i - 1) = String.sub (b, j - 1) then 0 else 1
          val v = Int.min (Array2.sub (table, i - 1, j) + 1,
                    Int.min (Array2.sub (table, i, j - 1) + 1,
                             Array2.sub (table, i - 1, j - 1) + cost))
        in
          Array2.update (table, i, j, v);
          compute (i, j + 1)
        end
    val () = compute (1, 1)
  in
    Array2.sub (table, m, n)
  end

val () = print (Int.toString (edit_distance ("kitten", "sitting")) ^ "\n")
