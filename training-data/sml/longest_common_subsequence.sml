fun make_matrix rows cols init =
  Array.tabulate (rows, fn _ => Array.tabulate (cols, fn _ => init))

fun mref (m, i, j) = Array.sub (Array.sub (m, i), j)
fun mset (m, i, j, v) = Array.update (Array.sub (m, i), j, v)

fun lcs_length (a, b) =
  let
    val m = String.size a
    val n = String.size b
    val dp = make_matrix (m + 1) (n + 1) 0
    val () =
      List.app
        (fn i =>
          List.app
            (fn j =>
              if i = 0 orelse j = 0 then ()
              else if String.sub (a, i - 1) = String.sub (b, j - 1)
              then mset (dp, i, j, mref (dp, i - 1, j - 1) + 1)
              else mset (dp, i, j, Int.max (mref (dp, i - 1, j), mref (dp, i, j - 1))))
            (List.tabulate (n + 1, fn j => j)))
        (List.tabulate (m + 1, fn i => i))
  in
    mref (dp, m, n)
  end

val () = print (Int.toString (lcs_length ("ABCBDAB", "BDCABA")) ^ "\n")
val () = print (Int.toString (lcs_length ("abc", "abc")) ^ "\n")
