fun lcs_length (a, b) =
  let
    val m = String.size a
    val n = String.size b
    val table = Array2.array (m + 1, n + 1, 0)
    fun compute (i, j) =
      if i > m then ()
      else if j > n then compute (i + 1, 1)
      else
        let
          val v =
            if String.sub (a, i - 1) = String.sub (b, j - 1) then
              Array2.sub (table, i - 1, j - 1) + 1
            else
              Int.max (Array2.sub (table, i - 1, j), Array2.sub (table, i, j - 1))
        in
          Array2.update (table, i, j, v);
          compute (i, j + 1)
        end
    val () = compute (1, 1)
  in
    Array2.sub (table, m, n)
  end

val () = print (Int.toString (lcs_length ("abcde", "ace")) ^ "\n")
val () = print (Int.toString (lcs_length ("abc", "abc")) ^ "\n")
val () = print (Int.toString (lcs_length ("abc", "def")) ^ "\n")
